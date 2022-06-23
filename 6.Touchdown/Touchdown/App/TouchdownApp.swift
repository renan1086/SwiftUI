//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by ZUP-5876 on 21/06/22.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
