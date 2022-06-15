//
//  __FructusApp.swift
//  4.Fructus
//
//  Created by ZUP-5876 on 13/06/22.
//

import SwiftUI

@main
struct __FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
              OnboardingView()
            } else {
              ContentView()
            }
        }
    }
}
