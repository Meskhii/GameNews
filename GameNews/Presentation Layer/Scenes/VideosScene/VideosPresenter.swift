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
    weak var videosViewController: VideosDisplayLogic?
}

extension VideosPresenter: VideosPresentationLogic {
    func present(data: [VideoCellModel]) {
        videosViewController?.display(data: data)
    }
}
