//
//  CenterModifier.swift
//  Africa
//
//  Created by ZUP-5876 on 21/06/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

