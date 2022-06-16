//
//  VideoModel.swift
//  Africa
//
//  Created by ZUP-5876 on 16/06/22.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
