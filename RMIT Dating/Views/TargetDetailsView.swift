//
//  TargetDetailsView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 17/09/2022.
//

import SwiftUI

struct TargetDetailsView: View {
    var body: some View {
        ZStack {
            VStack {
                ImageScrollView()
                HStack {
                    Spacer()
                    Image("arrow-down")
                        .padding(.trailing, 20)
                   
                }
                VStack {
                    HStack {
                        Text("Name")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                        Text("18")
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "location.fill")
                        Text("6")
                        Text("kilometers away")
                        Spacer()
                    }
                    .padding(.bottom, 20)
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
                    .padding(.bottom, 20)
                    
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
                    .padding(.bottom, 20)
                }
                .padding(.leading, 20)
                Spacer()
            }
        }
    }
}

struct ImageScrollView : View {
    var body: some View {
        Text("ImageScrollView")
            .frame(minWidth: 0, idealWidth: 180, maxWidth: .infinity, minHeight: 200, idealHeight: 350, maxHeight: 400, alignment: .center)
    }
}


struct AboutMeView : View {
    var body: some View {
        Text("AboutMeView")
    }
}

struct MyInterestsView : View {
    var body: some View {
        Text("MyInterestsView")
    }
}

struct TargetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDetailsView()
    }
}
