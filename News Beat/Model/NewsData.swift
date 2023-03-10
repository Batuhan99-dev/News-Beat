//
//  NewsData.swift
//  News Beat
//
//  Created by Batuhan Yılmaz on 10.03.2023.
//

import Foundation
struct NewsData:Codable {
    let status: String
    let articles: [ArticlesData]
}
