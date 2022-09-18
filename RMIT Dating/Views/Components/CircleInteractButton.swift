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
