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

struct CardImage: View {
    var image: Image
    var label: String
    
    var body: some View {
        VStack {
            image
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .frame(width: 200, height: 300)
                .clipped()
                .cornerRadius(50)
            
            Text(label)
        }
    }
}

struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        CardImage(image: Image("avatar-sample"), label: "Jisoo")
    }
}
