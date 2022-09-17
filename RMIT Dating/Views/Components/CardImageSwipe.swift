//
//  CardImageSwipe.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 17/09/2022.
//

import SwiftUI

struct CardImageSwipe: View {
    var image: Image
    
    var body: some View {
//        image
//            .resizable()
//            .aspectRatio(contentMode: .fill)
////            .scaledToFill()
//            .frame(width: 350, height: 500)
//            .clipped()
//            .cornerRadius(50)
        
        
        HStack {
            Spacer()
            GeometryReader { geo in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .scaledToFill()
                    .frame(width: geo.size.width * 0.8, height: 500)
                    .frame(width: geo.size.width)
                    .clipped()
                    .cornerRadius(50)
            }
            Spacer()
        } //end HStack

    }
}

struct CardImageSwipe_Previews: PreviewProvider {
    static var previews: some View {
        CardImageSwipe(image: Image("avatar-sample"))
    }
}
