//
//  NewsData.swift
//  HackerNewsApp
//
//  Created by Aman Giri on 2024-03-30.
//

import SwiftUI

class NewsData: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err)
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do{
                      let results = try decoder.decode(NewsModel.self, from: safeData)
                        DispatchQueue.main.async{
                            self.posts = results.hits
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}
