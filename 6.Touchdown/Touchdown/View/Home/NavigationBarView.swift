//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by ZUP-5876 on 21/06/22.
//

import SwiftUI

struct NavigationBarView: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })

            Spacer()

            LogoView()
                .opacity(isAnimating ? 1 : 0)
                .offset(x: 0, y: isAnimating ? 0 : -25)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.5)){
                        isAnimating.toggle()
                    }
                }

            Spacer()
            
            Button(action: {}, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundColor(.black)
                
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                }
            })
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
