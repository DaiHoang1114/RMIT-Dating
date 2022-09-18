/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Authors (ID):
    Nguyen Minh Tri    (s3726096)
    Duong Minh Nhat    (s3715125)
    Hoang Quoc Dai    (s3426353)
    Vu Duy Khoi    (s3694615)
  Created  date: 10/09/2022
  Last modified: 18/09/2022
  Acknowledgement:
    https://firebase.google.com/docs/build
    https://www.appcoda.com/swiftui-camera-photo-library/
    https://youtube.com (tutorial videos)
*/

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
