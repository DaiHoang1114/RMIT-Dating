//
//  SwipeView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct SwipeView: View {
    var numberOfImages = sampleImagesArray.count
    
    @State private var showingTargetDetailView = false
    
    var body: some View {
        ZStack {
            VStack {
                //MARK: Image Scroll
                VStack {
                    TabView {
                        ForEach(0..<numberOfImages, id: \.self) {
                            imIdx in
                            CardImageSwipe(image: sampleImagesArray[imIdx])
                        }
                    } //end TabView
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 500)
                    .overlay(
                        // MARK: - INFO
                        Button(action: {
                            self.showingTargetDetailView = true
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(ColorConstants.tinderPinkDarkColor)
                        }
                            .modifier(InfoButtonModifier())
//                                .offset(x: -20, y: -100)
                        ,alignment: .bottomTrailing
                    ) //end overlay of TabView
                } //end VStack
                
                Spacer()
                
                HStack {
                    Button {
                        //TODO: do something
                    } label: {
                        CircleInteractButton(image: Image(systemName: "multiply.circle"), color: ColorConstants.tinderPinkDarkColor)
                    }
                    
//                    Button {
//                        //TODO: do something
//                    } label: {
//                        CircleInteractButton(image: Image(systemName: "star.fill"), color: Color(.blue))
//                    }
                    
                    Button {
                        //TODO: do something
                    } label: {
                        CircleInteractButton(image: Image(systemName: "heart.fill"), color: ColorConstants.tinderPinkDarkColor)
                    }

                } //end HStack
                Spacer()

            } //end VStack
        } //end ZStack
        .sheet(isPresented: $showingTargetDetailView) {
            TargetDetailsView()
          }
        
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
