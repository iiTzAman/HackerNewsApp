//
//  ContentView.swift
//  HackerNewsApp
//
//  Created by Aman Giri on 2024-03-30.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newsData = NewsData()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.00, green: 0.81, blue: 0.79)
                    .ignoresSafeArea()
                VStack{
                    Text("Hacker News")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 20.0)
                    
                        List(newsData.posts){ post in
                            NavigationLink(destination: DetailView(url: post.url)){
                                HStack(alignment: .center){
                                    
                                    Text(String(post.points))
                                        .font(.subheadline)
                                        .foregroundColor(Color.gray)
                                    Text(post.title)
                                        .font(.subheadline)
                                }
                                
                            }
                        }
                        .listRowSpacing(10)
                }
            }
            .onAppear{
                self.newsData.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
