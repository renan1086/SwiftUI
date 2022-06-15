//
//  OnboardingView.swift
//  4.Fructus
//
//  Created by ZUP-5876 on 14/06/22.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: Properties

    var fruits: [Fruit] = fruitsData
    
    //MARK: body
    var body: some View {
        TabView {
            ForEach(fruits[0...fruits.count - 1]) { item in
                FruitCardView(fruit: item)
            }// :ForEach
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

//MARK: Preview

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
