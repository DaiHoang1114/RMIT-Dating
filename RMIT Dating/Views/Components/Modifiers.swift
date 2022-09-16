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
            .background(Color.green)
            .cornerRadius(15.0)
    }
}
