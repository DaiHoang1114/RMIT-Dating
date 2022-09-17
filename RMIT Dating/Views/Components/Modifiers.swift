//
//  Modifiers.swift
//  RMIT Dating
//
//  Created by Khoi, Vu Duy on 14/09/2022.
//

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
