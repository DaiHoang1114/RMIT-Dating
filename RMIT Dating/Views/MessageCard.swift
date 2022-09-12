//
//  MessageCard.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 12/09/2022.
//

import SwiftUI

struct MessageCard: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.blue)
            Rectangle()
                .fill(Color.red)
        }
    }
}
