//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by ZUP-5876 on 29/06/22.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
      return "developer-no\(randomNumber)"
    }

    var body: some View {
        VStack (spacing: 3) {
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
            
            Text("Robert Petras")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.secondary)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
