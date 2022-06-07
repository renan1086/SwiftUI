//
//  ContentView.swift
//  1.AsyncImage
//
//  Created by ZUP-5876 on 07/06/22.
//

import SwiftUI

extension Image {
    func imageMidifer() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifeier() -> some View {
        self
            .imageMidifer()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageUrl = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // MARK: 1. Basic
        
//        AsyncImage(url: URL(string: imageUrl))

        // MARK: 2. Scale
        
//        AsyncImage(url: URL(string: imageUrl), scale: 3.0)

        // MARK: 3. PlaceHolder
        
//        AsyncImage(url: URL(string: imageUrl)) { image in
//            image.imageMidifer()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").imageMidifer()
//        }
//        .padding(40)
        
        // MARK: 4. Phase
        
//        AsyncImage(url: URL(string: imageUrl)) { phase in
//
//            if let image = phase.image {
//                image.imageMidifer()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").imageMidifer()
//            } else {
//                Image(systemName: "photo.circle.fill").imageMidifer()
//            }
//        }
//        .padding(40)

        // MARK: 5. Animation
        
        AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .imageMidifer()
                    .transition(.move(edge: .top))
//                    .transition(.slide)
//                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").imageMidifer()
            case .empty:
                Image(systemName: "photo.circle.fill").imageMidifer()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
