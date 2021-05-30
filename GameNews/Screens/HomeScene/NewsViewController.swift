//
//  HomeViewController.swift
//  GameNews
//
//  Created by Admin on 08.05.2021.
//

import UIKit

protocol NewsDisplayLogic: AnyObject {
    func displayData()
}

class NewsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var horizontalMenuCollectionView: UICollectionView!
    @IBOutlet weak var newTableView: UITableView!

    // MARK: - Variables
    private var interactor: NewsBusinessLogic?

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
        let presenter = NewsPresenter()
        let interactor = NewsInteractor()
        interactor.presenter = presenter
        presenter.newsViewController = viewController
        viewController.interactor = interactor
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchNews()
        
        configureCollectionView()
        configureTableView()
    }
    
    private func configureCollectionView() {
        horizontalMenuCollectionView.delegate = self
        horizontalMenuCollectionView.dataSource = self
    }
    
    private func configureTableView() {
        newTableView.delegate = self
        newTableView.dataSource = self
    }

}

// MARK: - UICollectionView Data Source
extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

// MARK: - UICollectionView Delegate
extension NewsViewController: UICollectionViewDelegate {
    
}
// MARK: - UICollectionView Flow Layout
extension NewsViewController: UICollectionViewDelegateFlowLayout {
    
}

// MARK: - UITableView Data Source
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

// MARK: - UITableView Delegate
extension NewsViewController: UITableViewDelegate {
    
}

// MARK: - Display logic
extension NewsViewController: NewsDisplayLogic {
    func displayData() {
    }
}
