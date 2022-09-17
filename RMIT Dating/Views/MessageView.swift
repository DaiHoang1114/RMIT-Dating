//
//  MessageView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        VStack {
            HStack {
                Text("New Matches")
                    .foregroundColor(Color.red)
                Spacer()
            }.padding(.leading, 20)

            Divider()
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        CardImage(image: Image("avatar-sample"), label: "Jisoo")
                    }
                }.padding()
            }
            Divider()
            
            HStack {
                Text("Messages")
                    .foregroundColor(Color.red)
                Spacer()
            }.padding(.leading, 20)
            // Message List
            MessageList()
            
        } //end VStack
        .padding(.top, 100)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
