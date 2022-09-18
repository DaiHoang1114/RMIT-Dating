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
                    .frame(width: geo.size.width * 0.8, height: SizeConstants.swipeImageHeight)
                    .frame(width: geo.size.width)
                    .clipped()
                    .cornerRadius(50)
            }
            Spacer()
        } //end HStack
        .frame(height: SizeConstants.swipeImageHeight)
    }
}

struct CardImageSwipe_Previews: PreviewProvider {
    static var previews: some View {
        CardImageSwipe(image: Image("avatar-sample"))
    }
}
