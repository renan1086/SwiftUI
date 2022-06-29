//
//  NoteModel.swift
//  Notes WatchKit Extension
//
//  Created by ZUP-5876 on 29/06/22.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}
