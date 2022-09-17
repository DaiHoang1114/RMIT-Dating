//
//  TargetDetailsView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 17/09/2022.
//

import SwiftUI

struct TargetDetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                CardImageSwipe(image: Image("avatar-sample"))
                    .overlay(
                        Button(action: {
                            dismiss()
                        }) {
                            CircleInteractButton(image: Image("arrow-down"), color: ColorConstants.tinderPinkDarkColor)
                                .offset(y: 25)
                        },
                        alignment: .bottomTrailing
                    )
                
                ScrollView {
                    VStack {
                        HStack {
                            Text("Name - Jisoo")
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            Text("27")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "location.fill")
                            Text("6")
                            Text("kilometers away")
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        
                        HStack {
                            Text("About Me")
                                .fontWeight(.semibold)
                                .font(.system(size: 23))
                            Spacer()
                        }
                        HStack {
                            Text("Looking for chat, friendship")
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        
                        HStack {
                            Text("My Interests")
                                .fontWeight(.semibold)
                                .font(.system(size: 23))
                            Spacer()
                        }
                        HStack {
                            Text("Coffee")
                                .modifier(InterestModifier())
                            Text("Music")
                                .modifier(InterestModifier())
                            Text("Cooking")
                                .modifier(InterestModifier())
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                    } //end VStack
                    .padding(.leading, 20)
                    Spacer()
                } //end ScrollView
            } //end VStack
        } //end ZStack
    }
}

struct TargetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDetailsView()
    }
}
