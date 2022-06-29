//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by ZUP-5876 on 29/06/22.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title.uppercased())
            }
            
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")

                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
            
            HeaderView(title: "Credits")
        }
    }
}
