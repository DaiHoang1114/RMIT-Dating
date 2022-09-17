//
//  SwipeView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct SwipeView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 100)
                
                // Image Scroll
                VStack {
                    Divider()
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                CardImage(image: Image("avatar-sample"), label: "", width: 350, height: 500)
                            }
                        }.padding()
                    }.frame(height: 500)
                    Divider()
                    Spacer()
                }
                Spacer()
                
                // Row
                HStack {
                    Image(systemName: "multiply.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(minHeight: 20, idealHeight: 50, maxHeight: 60, alignment: .leading)
                    Spacer()
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .frame(minHeight: 20, idealHeight: 50, maxHeight: 60, alignment: .center)
                    Spacer()
                    Image(systemName: "heart.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(minHeight: 20, idealHeight: 50, maxHeight: 60, alignment: .trailing)
                }
                    .padding(.bottom, 60)
                    .padding([.leading, .trailing], 40)

            }
        }
        
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
