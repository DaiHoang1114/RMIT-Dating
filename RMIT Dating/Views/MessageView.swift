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
            Color.blue
            Text("Message View")
                .foregroundColor(Color.white)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
