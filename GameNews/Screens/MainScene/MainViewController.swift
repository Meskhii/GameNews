//
//  ViewController.swift
//  GameNews
//
//  Created by Admin on 08.05.2021.
//

import UIKit

protocol MainDisplayLogic: AnyObject {
    func displayData()
}

class MainViewController: UIViewController {

    // MARK: - External vars
    private(set) var router: MainRoutingLogic?

    // MARK: - Internal vars
    private var interactor: MainBusinessLogic?

    // MARK: - IBOutlets
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: - Inits

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        let viewController = self
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()

        interactor?.fetchUserDate()
    }

    // MARK: - Button methods
    @IBAction func onSignUp(_ sender: Any) {
        router?.navigateToSignUp(vcId: "SignUpViewController")
    }
    @IBAction func onLogin(_ sender: Any) {
        router?.navigateToLogin(vcId: "LoginViewController")
    }

    func setUpElements() {
        ButtonsDesign.styleFilledButton(signUpButton)
        ButtonsDesign.styleHollowButton(loginButton)
    }

}

// MARK: - Display logic
extension MainViewController: MainDisplayLogic {

    func displayData() {

    }

}
