//
//  PageModel.swift
//  3.Pinch
//
//  Created by ZUP-5876 on 10/06/22.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
