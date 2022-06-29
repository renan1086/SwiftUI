//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by ZUP-5876 on 29/06/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
