//
//  FactModel.swift
//  Avocados
//
//  Created by ZUP-5876 on 05/07/22.
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}
