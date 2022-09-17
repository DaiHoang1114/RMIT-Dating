//
//  CardImage.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct CardImage: View {
    var image: Image
    var label: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .clipped()
                .cornerRadius(50)
            
            Text(label)
        }
    }
}

struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        CardImage(image: Image("avatar-sample"), label: "Jisoo", width: 200, height: 300)
    }
}
