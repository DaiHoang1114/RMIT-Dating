//
//  CardImage.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct CardImage: View {
    @State var label: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.yellow)
            Text(label)
        }
    }
}
