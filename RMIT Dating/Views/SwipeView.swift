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
                HStack {
                    Text("Swipe View")
                        .foregroundColor(Color.red)
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
