//
//  VideosViewController.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit

protocol VideosDisplayLogic: AnyObject {
    func display(data: [VideoCellModel])
}

class VideosViewController: UIViewController {

    // MARK: - Variables
    private var interactor: VideosBusinessLogic?
    private(set) var router: VideosRoutingLogic?
    private var fetchedVideos = [VideoCellModel]()

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
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
        let presenter = VideosPresenter()
        let interactor = VideosInteractor()
        let router = VideosRouter()
        interactor.presenter = presenter
        presenter.videosViewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchVideosList()

        configureTableView()
    }

    private func configureTableView() {
        tableView.registerNib(class: VideoCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension VideosViewController: VideosDisplayLogic {
    func display(data: [VideoCellModel]) {
        self.fetchedVideos = data
        tableView.reloadData()
    }
}

extension VideosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedVideos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: VideoCell.self, for: indexPath)
        cell.configure(with: fetchedVideos[indexPath.row])
        return cell
    }

}
