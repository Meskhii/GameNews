//
//  SelectedGameNewsViewController.swift
//  GameNews
//
//  Created by Admin on 07.06.2021.
//

import UIKit

protocol SelectedGameNewsDisplayLogic: AnyObject {
    func display(data: [GameNewsModel])
}

class SelectedGameNewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    private var interactor: SelectedGameNewsBusinessLogic?
    private var selectedGameNews = [GameNewsModel]()
    var appId: String?

    // MARK: - Inits
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let viewController = self
        let presenter = SelectedGameNewsPresenter()
        let interactor = SelectedGameNewsInteractor()
        interactor.presenter = presenter
        presenter.selectedGameNewsViewController = viewController
        viewController.interactor = interactor
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        interactor?.fetchSelectedGameNews(appId: appId ?? "")
    }

    private func configureTableView() {
        self.tableView.registerNib(class: SelectedGameNewsCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension SelectedGameNewsViewController: SelectedGameNewsDisplayLogic {
    func display(data: [GameNewsModel]) {
          self.selectedGameNews = data
          tableView.reloadData()
    }
}

extension SelectedGameNewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedGameNews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: SelectedGameNewsCell.self, for: indexPath)
        cell.configure(with: selectedGameNews[indexPath.row])
        return cell
    }

}
