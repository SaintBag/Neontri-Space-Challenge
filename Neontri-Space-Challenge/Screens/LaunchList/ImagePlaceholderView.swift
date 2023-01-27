//
//  ImagePlaceholderView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
//

import SwiftUI

struct ImagePlaceholderView: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue, lineWidth: 10))
    }
}

struct ImagePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholderView()
    }
}
