//
//  DetailView.swift
//  HackerNewsApp
//
//  Created by Aman Giri on 2024-03-31.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "www.google.com")
}
