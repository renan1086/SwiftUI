//
//  RipeningModel.swift
//  Avocados
//
//  Created by ZUP-5876 on 05/07/22.
//

import SwiftUI

// MARK: RIPENING MODEL

struct Ripening: Identifiable {
  var id = UUID()
  var image: String
  var stage: String
  var title: String
  var description: String
  var ripeness: String
  var instruction: String
}
