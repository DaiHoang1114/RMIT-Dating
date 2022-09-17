//
//  MessageList.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 12/09/2022.
//

import SwiftUI

struct MessageList: View {
    var body: some View {
        VStack {
            Divider()
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        MessageCard(image: Image("avatar-sample"), name: "jisoo96", message: "i love you <3")
                            .frame(width: 400, height: 100)
                    }
                }.padding()
            }
//            Divider()
        }.frame(height: 350)
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
