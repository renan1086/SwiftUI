//
//  CircleGroupView.swift
//  2.Restart
//
//  Created by ZUP-5876 on 08/06/22.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: Property
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double

    // MARK: body

    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShapeColor:  .white, ShapeOpacity: 0.2)
        }
    }
}
