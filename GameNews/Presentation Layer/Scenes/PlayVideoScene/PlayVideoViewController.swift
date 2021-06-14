//
//  PlayVideoViewController.swift
//  GameNews
//
//  Created by Admin on 10.06.2021.
//

import UIKit
import youtube_ios_player_helper

class PlayVideoViewController: UIViewController {
    
    // MARK: - Variables
    var videoId: String?

    // MARK: - IBOutlets
    @IBOutlet var playerView: YTPlayerView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.delegate = self
        playVideo(with: videoId ?? "")
    }

    // MARK: - IBAction
    @IBAction func closeCurrentVideo(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - PlayVideo Logic
extension PlayVideoViewController {
    func playVideo(with videoId: String) {
        playerView.load(withVideoId: videoId, playerVars: ["playsinline" : 1])
    }
}
// MARK: - Youtube Player Delegate
extension PlayVideoViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
