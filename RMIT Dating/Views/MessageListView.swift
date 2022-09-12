//
//  MessageListView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 12/09/2022.
//

import SwiftUI

struct MessageListView: View {
    var body: some View {
        VStack {
            Divider()
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        MessageCard()
                            .frame(width: 400, height: 100)
                    }
                }.padding()
            }.frame(height: 400)
//            Divider()
            Spacer()
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
