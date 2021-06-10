//
//  VideosRouter.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit

protocol VideosRoutingLogic {
    func navigateToPlayVideoForSelected(videoId: String)
}

class VideosRouter {
    weak var viewController: UIViewController?
}

extension VideosRouter: VideosRoutingLogic {
    func navigateToPlayVideoForSelected(videoId: String) {
        let storyboard = UIStoryboard(name: "PlayVideoViewController", bundle: nil)
        let playVideoVC = storyboard.instantiateViewController(withIdentifier: "PlayVideoViewController") as! PlayVideoViewController // swiftlint:disable:this force_cast

        playVideoVC.videoId = videoId

        viewController?.present(playVideoVC, animated: true)
    }
}
