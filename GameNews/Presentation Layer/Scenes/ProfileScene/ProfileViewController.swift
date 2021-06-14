//
//  ProfileViewController.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit

protocol ProfileDisplayLogic: AnyObject {
    func displaySignOutError()
}

class ProfileViewController: UIViewController {
    
    // MARK: - Variables
    private var interactor: ProfileBusinessLogic?
    private(set) var router: ProfileRoutingLogic?
    private var worker: ProfileWorker?
    
    // MARK: Scene Setup
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
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let worker = ProfileWorker()
        interactor.presenter = presenter
        presenter.profileViewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        viewController.worker = worker
        router.viewController = viewController
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func requestNewsWebPage(_ sender: Any) {
        router?.openMailSender(with: "Request News Page")
    }
    
    @IBAction func requestFeature(_ sender: Any) {
        router?.openMailSender(with: "Request Feature")
    }
    
    @IBAction func logoutUser(_ sender: Any) {
        if ((worker?.signOut()) != nil) {
            router?.moveUserToWelcomePage()
        } else {
            displaySignOutError()
        }
    }
    
}
// MARK: - Display Logic
extension ProfileViewController: ProfileDisplayLogic {
    func displaySignOutError() {
        print("SignOut Error")
    }
}
