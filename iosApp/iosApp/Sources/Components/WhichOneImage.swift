//
//  CustomImageView.swift
//  iosApp
//
//  Created by Talha Faki on 27.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI


struct WhichOneImage: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .shadow(radius: 10)
                .aspectRatio(contentMode: .fill)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
                .onReceive(imageLoader.$image) { image in
                    self.image = image
                }
                .onAppear {
                    imageLoader.loadImage(for: urlString)
                }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 250,
            maxHeight: 250
        )
        .clipShape(RoundedRectangle(cornerRadius:10))
        .padding(EdgeInsets(top: 18, leading: 8, bottom: 0, trailing: 8))
        
    }
}

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
