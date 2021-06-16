//
//  ContentView.swift
//  GridSearch
//
//  Created by Luis Filipe Alves de Oliveira on 15/06/21.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var ViewModelGrid = GridViewModel()
    @State private var searchText: String = ""
    
    let gridSpaceMinimum: CGFloat = 100
    let gridSpaceMaximum: CGFloat = 100
    let gridSpacing: CGFloat = 16
    let titleNavigation: String = "Grid Search"
    let placeholderSearchBar: String = "Search App"
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(text: $searchText, placeholder: placeholderSearchBar)
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: gridSpaceMinimum, maximum: gridSpaceMaximum), spacing: gridSpacing, alignment: .top),
                    GridItem(.flexible(minimum: gridSpaceMinimum, maximum: gridSpaceMaximum), spacing: gridSpacing, alignment: .top),
                    GridItem(.flexible(minimum: gridSpaceMinimum, maximum: gridSpaceMaximum), spacing: gridSpacing, alignment: .top)
                ], spacing: 12, content: {
                    ForEach(ViewModelGrid.results.filter {
                        self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { app in
                        AppInfo(app: app)
                    }
                })
            }.navigationTitle(titleNavigation)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
