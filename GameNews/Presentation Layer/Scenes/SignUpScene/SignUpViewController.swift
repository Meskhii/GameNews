//
//  SignUpViewController.swift
//  GameNews
//
//  Created by Admin on 08.05.2021.
//

import UIKit

protocol SignUpDisplayLogic: AnyObject {
    func displaySignUpResult(viewModel: SignUp.ViewModel)
}

class SignUpViewController: UIViewController {

    // MARK: - Variables
    private(set) var router: SignUpRoutingLogic?
    private var interactor: SignUpBusinessLogic?

    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

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
        let presenter = SignUpPresenter()
        let interactor = SignUpInteractor()
        let router = SignUpRouter()
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

    }

    // MARK: - Sign Up User
    @IBAction func signUpTapped(_ sender: Any) {
        signUp()
    }

    private func signUp() {
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let request = SignUp.Request(firstName: firstName, lastName: lastName, email: email, password: password)
        interactor?.signUp(request: request)
    }

    // MARK: - Helper Methods
    private func setUpElements() {
        errorLabel.alpha = 0

        ButtonsDesign.styleFilledButton(signUpButton)
    }
    
    private func showError(message: String) {
        errorLabel.alpha = 1
        errorLabel.text = message
    }

}

// MARK: - Display logic
extension SignUpViewController: SignUpDisplayLogic {
    func displaySignUpResult(viewModel: SignUp.ViewModel) {
        if viewModel.success {
            router?.navigateToNews(vcId: VCIds.tabBarController)
        } else {
            showError(message: "Sign up error. Please try again.")
        }
    }
}
