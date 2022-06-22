//
//  ContentView.swift
//  Touchdown
//
//  Created by ZUP-5876 on 21/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 0){
                        FeaturedTabView()
                            .frame(minHeight: 256)
                            .padding(.vertical, 20)
                        
                        CategoryGridView()
                        
                        TitleView(title: "Helmets")
                        
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(products){ product in
                                ProductItemView(product: product)
                            }
                        }
                        .padding(15)
                        
                        BrandGridView()
                        
                        FooterView()
                            .padding(.horizontal)

                    }
                }
            }
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
