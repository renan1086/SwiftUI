//
//  CardView.swift
//  Developers
//
//  Created by ZUP-5876 on 04/07/22.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    @State private var isFadeIn: Bool = false
    @State private var isAnimating: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(isFadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: isAnimating ? -218 : -300)
            
            Button {
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
            } label: {
                HStack{
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(Color.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: isAnimating ? 210 : 300)

        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .onAppear(){
            withAnimation(.linear(duration: 1.2)){
                isFadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.6)){
                isAnimating.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
          Alert(
            title: Text(card.title),
            message: Text(card.message),
            dismissButton: .default(Text("OK"))
          )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1])
    }
}
