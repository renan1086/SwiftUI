//
//  HeaderModel.swift
//  Avocados
//
//  Created by ZUP-5876 on 05/07/22.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
  var id = UUID()
  var image: String
  var headline: String
  var subheadline: String
}
