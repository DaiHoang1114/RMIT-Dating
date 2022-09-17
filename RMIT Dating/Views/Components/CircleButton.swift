//
//  CircleButton.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 17/09/2022.
//

import SwiftUI

struct CircleButton: View {
//    @State var circleTapped = false
//    @State var circlePressed = false
    var image: Image
    var text: String
    
    var body: some View {
        VStack {
//            ZStack {
//                Image(systemName: "flame")
//                    .font(.system(size: 40, weight: .light))
//                    .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
//                    .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0),
//                                                        axis: (x: 10, y: -10, z: 0))
//            }
            image
//                .frame(width: 60, height: 60)
                .font(.system(size: 20, weight: .light))
                .background(
                    ZStack {
                        Circle()
                            .fill(ColorConstants.lightBlueGreyColor)
                            .frame(width: 50, height: 50) //Button Size.
                            .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                            .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                    }
                )
            //        .scaleEffect(circleTapped ? 1.2 : 1)
            //        .onTapGesture(count: 1) {
            //            self.circleTapped.toggle()
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //                self.circleTapped = false
            //            }
            //        } //end ZStack
            
            Text(text.uppercased())
                .padding(.top, 25)
        } //end VStack
        .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(image: Image(systemName: "pencil"), text: "edit profile")
        CircleButton(image: Image(systemName: "gear"), text: "settings")
        CircleButton(image: Image(systemName: "checkerboard.shield"), text: "safety")
        
    }
}
