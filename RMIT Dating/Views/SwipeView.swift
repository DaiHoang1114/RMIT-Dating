//
//  SwipeView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct SwipeView: View {
    var numberOfImages = sampleImagesArray.count
    
    var body: some View {
        ZStack {
            VStack {
                //MARK: Image Scroll
                TabView {
                    ForEach(0..<numberOfImages, id: \.self) {
                        imIdx in
                            CardImage(image: sampleImagesArray[imIdx], label: "", width: 350, height: 500)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            
                HStack {
                    Button {
                        //TODO: do something
                    } label: {
                        CircleInteractButton(image: Image(systemName: "multiply.circle"), color: ColorConstants.tinderPinkDarkColor)
                    }
                    
                    Button {
                        //TODO: do something
                    } label: {
                        CircleInteractButton(image: Image(systemName: "star.fill"), color: Color(.blue))
                    }
                    
                    Button {
                        //TODO: do something
                    } label: {
                        CircleInteractButton(image: Image(systemName: "heart.fill"), color: ColorConstants.tinderPinkDarkColor)
                    }

                } //end HStack
                Spacer()

            }
        }
        
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
