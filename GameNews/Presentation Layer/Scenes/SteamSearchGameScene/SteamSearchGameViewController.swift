//
//  SteamNewsViewController.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit

protocol SteamSearchGameDisplayLogic: AnyObject {
    func display(data: [SearchResultCellModel])
}

class SteamSearchGameViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    private var interactor: SteamSearchGameBusinessLogic?
    private(set) var router: SteamSearchGameRoutingLogic?
    private var searchResults = [SearchResultCellModel]()

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
        let presenter = SteamSearchGamePresenter()
        let interactor = SteamSearchGameInteractor()
        let router = SteamSearchGameRouter()
        interactor.presenter = presenter
        presenter.steamSearchGameViewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchSearchedGame()

        configureTableView()
    }

    private func configureTableView() {
        tableView.registerNib(class: SearchResultCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension SteamSearchGameViewController: SteamSearchGameDisplayLogic {
    func display(data: [SearchResultCellModel]) {
        self.searchResults = data
        tableView.reloadData()
    }
}

extension SteamSearchGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: SearchResultCell.self, for: indexPath)
        cell.configure(searchResult: searchResults[indexPath.row])
        return cell
    }

}

extension SteamSearchGameViewController: UITableViewDelegate {

}
