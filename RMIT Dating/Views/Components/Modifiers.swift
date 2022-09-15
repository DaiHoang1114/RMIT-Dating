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
            .background(Color("Light Grey"))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .padding(.horizontal)
    }
}
