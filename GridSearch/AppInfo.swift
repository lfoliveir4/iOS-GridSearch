//
//  AppInfo.swift
//  GridSearch
//
//  Created by Luis Filipe Alves de Oliveira on 16/06/21.
//

import SwiftUI
import Kingfisher

struct AppInfo: View {
    
    let app: Result
    let cornerRadiusImage: CGFloat = 22
    let sizeFontMedium: CGFloat = 10
    let sizeFontSmall: CGFloat = 9
    let background = Color.gray
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            KFImage(URL(string: app.artworkUrl100)).resizable().scaledToFit().cornerRadius(cornerRadiusImage)
            Text(app.name).font(.system(size: sizeFontMedium, weight: .semibold)).padding(.top, 4)
            Text(app.releaseDate).font(.system(size: sizeFontMedium, weight: .regular))
            Text(app.copyright).font(.system(size: sizeFontSmall, weight: .regular)).foregroundColor(background)
            
            Spacer()
          
        }.padding(.horizontal)
    }
}

