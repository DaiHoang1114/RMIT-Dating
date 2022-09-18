//
//  MessageView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct MessageView: View {
    
    @EnvironmentObject var targetVM: TargetViewModel
    
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
                    ForEach(targetVM.getMatchInfos(), id:\.userId) { matchInfo in
                        CardImage(image: Image("avatar-sample"), label: matchInfo.getName())
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
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .environmentObject(TargetViewModel())
    }
}
