//
//  ColorChangingView.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/21/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import SwiftUI
import Nami

func chooseRandomColor() -> Color {
    let randomR : Double = Double.random(in: 0 ..< 1)
    let randomG : Double = Double.random(in: 0 ..< 1)
    let randomB : Double = Double.random(in: 0 ..< 1)

    let newColor = Color(red: randomR, green: randomG, blue: randomB)

    return newColor
}

struct ColorChangingView: View {
        
    @State var viewColor: Color = chooseRandomColor()
    
    var body: some View {
        VStack(spacing: 30) {
            Rectangle()
                .fill(viewColor)
                .frame(width: 200, height: 200)
                .gesture(TapGesture().onEnded{ _ in
                    viewColor = chooseRandomColor()
                }
                )
        }
    }
}
