//
//  CircleImage.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 17/09/2022.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color(.white),lineWidth: 4))
//            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("avatar-sample"))
    }
}
