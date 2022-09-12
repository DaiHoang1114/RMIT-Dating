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
                // Image Scroll
                VStack {
                    HStack {
                        Text("New Matches")
                            .foregroundColor(Color.red)
                        Spacer()
                    }
                    .padding(.leading, 20)
                    
                    Divider()
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                CardImageView(label: "\(index)")
                                    .frame(width: 200, height: 200)
                            }
                        }.padding()
                    }
                    Divider()
                    
                    
                    HStack {
                        Text("Messages")
                            .foregroundColor(Color.red)
                        Spacer()
                    }
                    .padding(.leading, 20)
                    Spacer()
                    
                    // Message List
                    MessageListView()
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
