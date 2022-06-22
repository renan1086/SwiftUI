//
//  CategoryModel.swift
//  Touchdown
//
//  Created by ZUP-5876 on 22/06/22.
//

import Foundation

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
}
