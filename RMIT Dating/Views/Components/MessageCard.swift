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

struct MessageCard: View {
    var image: Image
    var name: String
    var message: String
    
    
    var body: some View {
        HStack {
            CircleImage(image: image, width: 100, height: 100)
            Spacer()
            VStack {
                Text(name)
                    .font(.system(size: 25, weight: .bold))
                Text(message)
            }
            Spacer()
        }
    }
}

struct MessageCard_Previews: PreviewProvider {
    static var previews: some View {
        MessageCard(image: Image("avatar-sample"), name: "jisoo96", message: "i love you <3")
    }
}
