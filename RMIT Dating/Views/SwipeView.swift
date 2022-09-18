//
//  SwipeView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI
import FirebaseStorage

struct SwipeView: View {
    
    @EnvironmentObject var targetVM: TargetViewModel
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    
    var numberOfImages = sampleImagesArray.count
    
    @State var images = [String]()
    
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
                            if targetVM.getViewingTarget().getImages().count > 0 {
                                ForEach(0..<self.images.count, id: \.self) {
                                    imIdx in
    //                                CardImageSwipe(image: sampleImagesArray[imIdx])
//                                    CardImageSwipe(image: Image(uiImage: self.images[imIdx]))
//                                    Image(uiImage: UIImage(data: images[0])!)
                                }
                                .onAppear {
                                    let storageRef = Storage.storage().reference()
                                    for refString in targetVM.getViewingTarget().getImages() {
                                        let imageRefString = refString
                                        let imageRef = storageRef.child(imageRefString)
                                        imageRef.getData(maxSize: Int64(10 * 1024 * 1024)) { data, error in
                                            if let data = data {
                                                images.append("success")
                                                print("-------")
                                            }
                                        }
                                    }                                }
                            } else if targetVM.getViewingTarget().getImages().count == 0 {
                                CardImageSwipe(image: Image(systemName: "person"))
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
