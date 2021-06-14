//
//  BookmarksViewController.swift
//  GameNews
//
//  Created by user200006 on 6/14/21.
//

import UIKit

protocol BookmarksDisplayLogic: AnyObject {
    
}

class BookmarksViewController: UIViewController {
    
    // MARK: - Variables
    private var interactor: BookmarksBusinessLogic?
    private(set) var router: BookmarksRoutingLogic?
    
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
        let presenter = BookmarksPresenter()
        let interactor = BookmarksInteractor()
        let router = BookmarksRouter()
        interactor.presenter = presenter
        presenter.bookmarksViewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension BookmarksViewController: BookmarksDisplayLogic {
    
}
