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

struct TargetDetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var targetVM: TargetViewModel
    
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
                            Text(targetVM.getViewingTarget().getName().isEmpty ? "No Name": targetVM.getViewingTarget().getName())
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            Text("\(targetVM.calculateAge())")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "location.fill")
                            Text("\(Int.random(in: 1..<20))")
                            Text("kilometer(s) away")
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
                            Text("Gender: \(targetVM.getViewingTarget().getGender().isEmpty ? "Unidentified" : targetVM.getViewingTarget().getGender())")
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        HStack {
                            Text("Religion: \(targetVM.getViewingTarget().getReligion().isEmpty ? "None" : targetVM.getViewingTarget().getReligion())")
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        HStack {
                            Text("Marital: \(targetVM.getViewingTarget().getMaritalStatus().isEmpty ? "Unidentified" : targetVM.getViewingTarget().getMaritalStatus())")
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
//                            Text("Coffee")
//                                .modifier(InterestModifier())
//                            Text("Music")
//                                .modifier(InterestModifier())
//                            Text("Cooking")
//                                .modifier(InterestModifier())
                            ForEach(targetVM.getViewingTarget().getHobbies(), id: \.self) { hobby in
                                    Text(hobby)
                                        .modifier(InterestModifier())
                            }
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        
                        HStack {
                            Text("Music Genre")
                                .fontWeight(.semibold)
                                .font(.system(size: 23))
                            Spacer()
                        }
                        HStack {
                            ForEach(targetVM.getViewingTarget().getMusics(), id: \.self) { music in
                                    Text(music)
                                        .modifier(InterestModifier())
                            }
                            Spacer()
                        }
                        
                    } //end VStack
                    .padding(.leading, 20)
                    Spacer()
                } //end ScrollView
            } //end VStack
        } //end ZStack
    } //end body
}

struct TargetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDetailsView()
            .environmentObject(TargetViewModel())
    }
}
