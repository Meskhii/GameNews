//
//  ConfigureNewsWorker.swift
//  GameNews
//
//  Created by Admin on 10.06.2021.
//

import Foundation

class ConfigureNewsWorker {
    
    func mockFetchedWebPages() -> [WebPagesModel] {

        var mockData = [WebPagesModel]()
        
        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                       webPageName: "Page One",
                                       isWebPageCheck: true))

        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                       webPageName: "Page Two",
                                       isWebPageCheck: true))

        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                       webPageName: "Page Three",
                                       isWebPageCheck: true))

        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                       webPageName: "Page Four",
                                       isWebPageCheck: true))

        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                       webPageName: "Page Five",
                                       isWebPageCheck: true))

        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                       webPageName: "Page Six",
                                       isWebPageCheck: true))

        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                       webPageName: "Page Seven",
                                       isWebPageCheck: true))

        mockData.append(WebPagesModel(webPageLogo: "ignLogo",
                                  webPageName: "Page Eight",
                                  isWebPageCheck: true))

        return mockData
    }

}
