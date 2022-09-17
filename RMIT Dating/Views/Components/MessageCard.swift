//
//  MessageCard.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 12/09/2022.
//

import SwiftUI

struct MessageCard: View {
    var image: Image
    var name: String
    var message: String
    
    
    var body: some View {
        HStack {
            CircleImage(image: image, width: 100, height: 100)
            Spacer()
            VStack {
                Text(name)
                    .font(.system(size: 25, weight: .bold))
                Text(message)
            }
            Spacer()
        }
    }
}

struct MessageCard_Previews: PreviewProvider {
    static var previews: some View {
        MessageCard(image: Image("avatar-sample"), name: "jisoo96", message: "i love you <3")
    }
}
