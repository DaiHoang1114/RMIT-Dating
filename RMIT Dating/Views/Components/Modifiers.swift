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

struct TextFieldInputModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(ColorConstants.lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .padding(.horizontal)
            .textInputAutocapitalization(.never)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(ColorConstants.tinderPinkDarkColor)
            .cornerRadius(15.0)
    }
}

struct InfoButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title)
      .accentColor(.white)
      .padding()
  }
}

struct InterestModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(.gray, lineWidth: 2)
            )
    }
}

struct InfoTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.top, 5)
            .padding(.bottom, 10)
    }
}
