//
//  MessageBubble.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 18/09/2022.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading: .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? ColorConstants.lightGreyColor : ColorConstants.tinderPinkLightColor)
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        } //VStack
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    } //end body
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "123", text: "Hello, what are you doing?", received: true, timestamp: Date(), ownerId: "xxx"))
    }
}
