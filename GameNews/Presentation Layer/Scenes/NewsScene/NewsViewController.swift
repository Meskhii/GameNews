//
//  HomeViewController.swift
//  GameNews
//
//  Created by Admin on 08.05.2021.
//

import UIKit

protocol NewsCollectionViewDataDelegate {
    func updateWebSitesImages(checkedLogo: String, checked: Bool)
    func getUpdatedWebPages(webPages: [WebPagesModel])
}

protocol NewsDisplayLogic: AnyObject {
    func display(data: [NewsCellModel])
}

class NewsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var horizontalMenuCollectionView: UICollectionView!
    @IBOutlet weak var newsTableView: UITableView!

    // MARK: - Variables
    private var interactor: NewsBusinessLogic?
    private(set) var router: NewsRoutingLogic?

    private var webSitesImages = ["ic_add", "ign_logo", "gameinformer_logo", "eurogamer_logo", "gamespot_logo", "pcgamer_logo"]

    private var news = [NewsCellModel]()
    private var webPages = [WebPagesModel]()
    private var tempAllNews = [NewsCellModel]()

    // MARK: - Scene Setup
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
        let presenter = NewsPresenter()
        let interactor = NewsInteractor()
        let router = NewsRouter()
        interactor.presenter = presenter
        presenter.newsViewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchNews(webPageNames: webSitesImages)

        navigationController?.navigationBar.isHidden = true

        configureCollectionView()
        configureTableView()
    }

    // MARK: - Collection View Configuration
    private func configureCollectionView() {
        horizontalMenuCollectionView.registerNib(class: WebPagesCell.self)
        horizontalMenuCollectionView.delegate = self
        horizontalMenuCollectionView.dataSource = self
        horizontalMenuCollectionView.backgroundColor = UIColor(named: "ViewBackground")
        horizontalMenuCollectionView.showsHorizontalScrollIndicator = false

        if let flowLayout = self.horizontalMenuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
               flowLayout.scrollDirection = .horizontal
        }
    }

    // MARK: - Table View Configuration
    private func configureTableView() {
        newsTableView.registerNib(class: NewsCell.self)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.tableFooterView = UIView(frame: .zero)
    }

}
// MARK: - Display logic
extension NewsViewController: NewsDisplayLogic {
    func display(data: [NewsCellModel]) {
        data.forEach { newsModel in
            self.news.append(newsModel)
        }
        news.shuffle()
        if tempAllNews.isEmpty {
            tempAllNews = news
        }
        newsTableView.reloadData()
    }
}

// MARK: - CollectionView Data Delegate
extension NewsViewController: NewsCollectionViewDataDelegate {
    func getUpdatedWebPages(webPages: [WebPagesModel]) {
        self.webPages = webPages
    }
    
    func updateWebSitesImages(checkedLogo: String, checked: Bool) {
        if checked {
            if !webSitesImages.contains(checkedLogo) {
                webSitesImages.append(checkedLogo)
            }
        } else {
            while let index = webSitesImages.firstIndex(of: checkedLogo) {
                webSitesImages.remove(at: index)
            }
        }
        news.removeAll()
        interactor?.fetchNews(webPageNames: webSitesImages)
        horizontalMenuCollectionView.reloadData()
    }
}

// MARK: - UICollectionView Data Source
extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webSitesImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(WebPagesCell.self, for: indexPath)
        cell.configure(with: webSitesImages[indexPath.row])
        return cell
    }

}

// MARK: - UICollection View Delegate
extension NewsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            router?.openConfigureNewsViewController(with: webPages)
            collectionView.deselectItem(at: indexPath, animated: false)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let item = collectionView.cellForItem(at: indexPath)
        
        if item?.isSelected ?? false {
            collectionView.deselectItem(at: indexPath, animated: true)
            news = tempAllNews
            newsTableView.reloadData()
        } else {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            news.removeAll()
            interactor?.fetchNews(webPageNames: [webSitesImages[indexPath.row]])
            return true
        }

        return false
    }
}

// MARK: - UICollectionView Flow Layout
extension NewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    
}

// MARK: - UITableView Data Source
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: NewsCell.self, for: indexPath)
        if !news.isEmpty {
            cell.configure(data: news[indexPath.row])
        }
        return cell
    }
}

// MARK: - UITableView Delegate
extension NewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        router?.openSelectedNewsInWebView(defaultURL: news[indexPath.row].webPageURL, articleURL: news[indexPath.row].hrefURL ?? "")
    }
}
