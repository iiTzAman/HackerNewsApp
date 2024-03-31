//
//  NewsModel.swift
//  HackerNewsApp
//
//  Created by Aman Giri on 2024-03-30.
//

import SwiftUI

struct NewsModel: Codable {
    let hits : [Post]
}

struct Post: Codable, Identifiable {
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
    var id: String {
        return objectID
    }
}
