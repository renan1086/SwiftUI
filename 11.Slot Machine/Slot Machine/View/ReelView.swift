//
//  ReelView.swift
//  Slot Machine
//
//  Created by ZUP-5876 on 11/07/22.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
          .previewLayout(.fixed(width: 220, height: 220))
    }
}
