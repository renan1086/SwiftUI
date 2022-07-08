//
//  RipeningStageView.swift
//  Avocados
//
//  Created by ZUP-5876 on 05/07/22.
//

import SwiftUI

struct RipeningStageView: View {
    
    var ripeningStages: [Ripening] = ripeningData

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { item in
                        RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                
                Spacer()
            }
        }
    }
}

struct RipeningStageView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStageView()
    }
}
