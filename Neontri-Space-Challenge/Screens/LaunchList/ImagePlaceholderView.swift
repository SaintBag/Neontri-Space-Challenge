//
//  ImagePlaceholderView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
//

import SwiftUI
import URLImage

struct ImagePlaceholderView: View {
    let imageString: String?
    let id: String?
    
    var body: some View {
        if let imageUrl = imageString,
           let url = URL(string: imageUrl) {
            URLImage(url, identifier: id, failure: { error, _ in
                
            }, content: { rocketImage in
                rocketImage
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 10))
            })
        } else {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 10))
        }
    }
}

struct ImagePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholderView(imageString: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_image_20221214103909.png", id: "1")
    }
}
