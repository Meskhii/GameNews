//
//  ConfigureNewsViewController.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit

protocol ConfigureNewsDisplayLogic: AnyObject {
    func displayWebPageOptions(data: [WebPagesModel])
}

class ConfigureNewsViewController: UIViewController {
    
    private var interactor: ConfigureNewsBusinessLogic?
    private(set) var router: ConfigureNewsRoutingLogic?
    
    private var webPageOptions = [WebPagesModel]()
    
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
        let presenter = ConfigureNewsPresenter()
        let interactor = ConfigureNewsInteractor()
        let router = ConfigureNewsRouter()
        interactor.presenter = presenter
        presenter.configureNewsViewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ConfigureNewsViewController: ConfigureNewsDisplayLogic {
    func displayWebPageOptions(data: [WebPagesModel]) {
        webPageOptions = data
    }

}
