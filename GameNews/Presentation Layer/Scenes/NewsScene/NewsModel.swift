//
//  NewsModel.swift
//  GameNews
//
//  Created by Admin on 04.06.2021.
//

import Foundation

struct NewsModel: Codable {
    let titles: [String]
    let imgURLs: [String]
    let postTimes: [String]
    let hrefURLs: [String]
    let webPageLogo: String
    let webPageName: String
    let webPageURL: String
}
