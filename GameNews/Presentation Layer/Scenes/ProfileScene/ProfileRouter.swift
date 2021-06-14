//
//  ProfileRouter.swift
//  GameNews
//
//  Created by user200006 on 6/13/21.
//

import UIKit
import MessageUI

protocol ProfileRoutingLogic {
    func openMailSender(with subject: String)
    func moveUserToWelcomePage()
}

class ProfileRouter: NSObject {
    // MARK: - Variables
    weak var viewController: UIViewController?
}
// MARK: - Routing Logic
extension ProfileRouter: ProfileRoutingLogic {
    
    // MARK: - Present Welcome Page
    func moveUserToWelcomePage() {
        let storyboard = UIStoryboard(name: "WelcomeViewController", bundle: nil)
        let welcomeVC = storyboard.instantiateViewController(withIdentifier: "WelcomeNavigationController")
        welcomeVC.modalPresentationStyle = .fullScreen
        viewController?.present(welcomeVC, animated: true)
    }
    
    // MARK: - Present Mail Composer
    func openMailSender(with subject: String) {
        guard MFMailComposeViewController.canSendMail() else {
            print("error opening MailComposer")
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["request@mail.com"])
        composer.setSubject(subject)
        
        viewController?.present(composer, animated: true)
    }
}

// MARK: - Mail Compose Delegate
extension ProfileRouter: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
        case .failed:
            print("Failed")
        @unknown default:
            print("Unknown Error")
        }
        
        controller.dismiss(animated: true)
        
    }
    
}
