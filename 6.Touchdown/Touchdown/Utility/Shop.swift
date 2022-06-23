//
//  Shop.swift
//  Touchdown
//
//  Created by ZUP-5876 on 23/06/22.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? //= nil
}
