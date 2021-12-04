//
//  LeftEyeView.swift
//  Super Eye
//
//  Created by iMac on 04.12.2021.
//

import SwiftUI

struct EyeView: View {
    var body: some View {
        GeometryReader {geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            
            ZStack {
                Circle()
                    .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.yellow, .orange.opacity(0.9)]),
                        startPoint: UnitPoint(x: 1, y: 1),
                        endPoint: UnitPoint(x: 0, y: 1)
                    )
                    )
            }
            
        }
        
        
    }
}

struct EyeView_Previews: PreviewProvider {
    static var previews: some View {
        EyeView()
            .frame(width: 70, height: 70)
    }
}
