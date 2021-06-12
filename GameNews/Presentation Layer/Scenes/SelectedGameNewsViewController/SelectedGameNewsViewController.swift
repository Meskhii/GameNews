//
//  SelectedGameNewsViewController.swift
//  GameNews
//
//  Created by Admin on 07.06.2021.
//

import UIKit

protocol SelectedGameNewsCellDelegate: AnyObject {
    func readFullArticleTappedFor(_ articleURL: String)
}

protocol SelectedGameNewsDisplayLogic: AnyObject {
    func display(data: [GameNewsModel])
}

class SelectedGameNewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    private var interactor: SelectedGameNewsBusinessLogic?
    private var selectedGameNews = [GameNewsModel]()
    private(set) var router: SelectedGameNewsRoutingLogic?
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
        let router = SelectedGameNewsRouter()
        interactor.presenter = presenter
        presenter.selectedGameNewsViewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false

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
        cell.delegate = self
        return cell
    }

}

extension SelectedGameNewsViewController: SelectedGameNewsCellDelegate {
    func readFullArticleTappedFor(_ articleURL: String) {
        router?.openSelectedGameNewsInSafariView(using: articleURL)
    }
}
