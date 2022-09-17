//
//  CircleInteractButton.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 17/09/2022.
//

import SwiftUI

struct CircleInteractButton: View {
    var image: Image
    var color: Color
    
    var body: some View {
        VStack {
            image
                .font(.system(size: 70, weight: .light))
                .foregroundColor(color)
                .background(
                    ZStack {
                        Circle()
                            .fill(ColorConstants.lightBlueGreyColor)
                            .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                            .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                    }
                )
        } //end VStack
        .padding()
    }
}

struct CircleInteractButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleInteractButton(image: Image(systemName: "multiply.circle"), color: ColorConstants.tinderPinkDarkColor)
        CircleInteractButton(image: Image(systemName: "star.fill"), color: Color(.blue))
        CircleInteractButton(image: Image(systemName: "heart.fill"), color: ColorConstants.tinderPinkDarkColor)
        
    }
}
