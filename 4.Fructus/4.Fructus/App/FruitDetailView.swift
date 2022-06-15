//
//  FruitDetailView.swift
//  4.Fructus
//
//  Created by ZUP-5876 on 14/06/22.
//

import SwiftUI

struct FruitDetailView: View {
    
    var fruit: Fruit
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    //header
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        //Title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        //Headline
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        //Nutrients
                        FruitNutrientsView(fruit: fruit)
                        
                        //Subheadline
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        //Description
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        //link
//                        SourceLinkView()
//                            .padding(.top, 10)
//                            .padding(.bottom, 20)
                        
                    }// :VStack
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }// :VStack
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            }// :ScrollView
            edgesIgnoringSafeArea(.top)
        }// :NavigationView
        .navigationViewStyle(.stack)
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
