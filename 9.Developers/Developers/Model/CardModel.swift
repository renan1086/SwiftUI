//
//  CardModel.swift
//  Developers
//
//  Created by ZUP-5876 on 04/07/22.
//

import SwiftUI

struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
