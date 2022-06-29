//
//  BackgroundImageView.swift
//  Devote
//
//  Created by ZUP-5876 on 29/06/22.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .resizable()
            .scaledToFit()
            .ignoresSafeArea(.all)
            .clipped(antialiased: true)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
