//
//  VideosPresenter.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import Foundation

protocol VideosPresentationLogic {
    func present(data: [VideoCellModel])
}

class VideosPresenter {
    // MARK: - Variables
    weak var videosViewController: VideosDisplayLogic?
}
// MARK: - Presentation Logic
extension VideosPresenter: VideosPresentationLogic {
    func present(data: [VideoCellModel]) {
        videosViewController?.display(data: data)
    }
}
