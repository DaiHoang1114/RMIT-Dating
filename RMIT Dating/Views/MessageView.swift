//
//  MessageView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Message View")
                        .foregroundColor(Color.red)
                }
                .padding(.bottom, 100)
                // Image Scroll
                VStack {
                    Divider()
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                CardImageView(label: "\(index)")
                            }
                        }.padding()
                    }.frame(height: 100)
                    Divider()
                    Spacer()
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
