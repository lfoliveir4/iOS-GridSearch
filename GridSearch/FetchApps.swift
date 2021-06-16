//
//  FetchApps.swift
//  GridSearch
//
//  Created by Luis Filipe Alves de Oliveira on 16/06/21.
//

import SwiftUI

struct RSS: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable, Hashable {
    let copyright, name, artworkUrl100, releaseDate: String
}

class GridViewModel: ObservableObject {
    @Published var results = [Result]()
    
    let urlJSON = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/100/explicit.json"
    
    init() {
        guard let url = URL(string: urlJSON) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            guard let data = data else { return }
            
            do {
                let rss = try JSONDecoder().decode(RSS.self, from: data)
                self.results = rss.feed.results
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
}
