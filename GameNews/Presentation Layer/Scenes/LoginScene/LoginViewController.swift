//
//  LoginViewController.swift
//  GameNews
//
//  Created by Admin on 08.05.2021.
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displayLoginResult(viewModel: Login.ViewModel)
}

class LoginViewController: UIViewController {

    // MARK: - Variables
    private(set) var router: LoginRoutingLogic?
    private var interactor: LoginBusinessLogic?

    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

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
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }

    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }

    // MARK: - Login
    @IBAction func loginClicked(_ sender: Any) {
        login()
    }

    private func login() {
        let email = emailTextField.text
        let password = passwordTextField.text
        let request = Login.Request(email: email, password: password)
        interactor?.fetchUser(request: request)
    }

    // MARK: - Helper methods
   private  func showError(message: String) {
        errorLabel.alpha = 1
        errorLabel.text = message
    }

    private func setUpElements() {
        errorLabel.alpha = 0
        ButtonsDesign.styleFilledButton(loginButton)
    }

}

// MARK: - Display logic
extension LoginViewController: LoginDisplayLogic {
    func displayLoginResult(viewModel: Login.ViewModel) {
        if viewModel.success {
            router?.navigateToNews(vcId: VCIds.tabBarController)
        } else {
            showError(message: "Sign up error. Please try again.")
        }
    }
}
