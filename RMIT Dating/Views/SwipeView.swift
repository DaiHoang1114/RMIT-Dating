/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Authors (ID):
    Nguyen Minh Tri    (s3726096)
    Duong Minh Nhat    (s3715125)
    Hoang Quoc Dai    (s3426353)
    Vu Duy Khoi    (s3694615)
  Created  date: 10/09/2022
  Last modified: 18/09/2022
  Acknowledgement:
    https://firebase.google.com/docs/build
    https://www.appcoda.com/swiftui-camera-photo-library/
    https://youtube.com (tutorial videos)
*/

import SwiftUI

struct SwipeView: View {
    
    @EnvironmentObject var targetVM: TargetViewModel
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    
    var numberOfImages = sampleImagesArray.count
    
    @State private var showingTargetDetailView = false
    
    var body: some View {
        ZStack {
            
            if targetVM.isOutOfTargets() {
                Text("Your target dating user is running out! Please come back later!")
            }
            else {
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
                        .frame(height: SizeConstants.swipeImageHeight)
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
                            targetVM.dislikeTarget(userId: userInfoVM.getUserId())
                        } label: {
                            CircleInteractButton(image: Image(systemName: "multiply.circle"), color: ColorConstants.tinderPinkDarkColor)
                        }
                        .disabled(targetVM.isOutOfTargets())
                        
    //                    Button {
    //                        //TODO: do something
    //                    } label: {
    //                        CircleInteractButton(image: Image(systemName: "star.fill"), color: Color(.blue))
    //                    }
                        
                        Button {
                            targetVM.likeTarget(userId: userInfoVM.getUserId())
                        } label: {
                            CircleInteractButton(image: Image(systemName: "heart.fill"), color: ColorConstants.tinderPinkDarkColor)
                        }
                        .disabled(targetVM.isOutOfTargets())

                    } //end HStack
                    Spacer()

                } //end VStack
            }
        } //end ZStack
        .sheet(isPresented: $showingTargetDetailView) {
            TargetDetailsView()
          }
        
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
            .environmentObject(TargetViewModel())
            .environmentObject(UserInfoViewModel())
    }
}
