//
//  CardImageView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct CardImageView: View {
    @State var label: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 350, height: 350)
            Text(label)
        }
    }
}
