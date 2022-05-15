//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Konstantin Korchak on 14.05.2022.
//

import SwiftUI

enum Lights {
    case none
    case red
    case yellow
    case green
}

struct ContentView: View {
    
    @State private var buttonLabel = "START"
    
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    
    @State private var currentLight: Lights = .none
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    lights
                        .padding(.top, 25)
                        .padding(.bottom, geometry.size.height * 0.15)
                    button
                        .padding(.bottom, 30)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
    
    private var lights: some View {
        VStack {
            Circle()
                .foregroundColor(.red)
                .opacity(redOpacity)
            Circle()
                .foregroundColor(.yellow)
                .opacity(yellowOpacity)
            Circle()
                .foregroundColor(.green)
                .opacity(greenOpacity)
        }
    }
    
    private var button: some View {
        Button(action: buttonPressed) {
            Text(buttonLabel)
                .padding(8)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(12)
        }
    }
    
    private func buttonPressed() {
        switch currentLight {
        case .none:
            buttonLabel = "NEXT"
            redOpacity = 0.9
            currentLight = .red
        case .red:
            redOpacity = 0.3
            yellowOpacity = 0.9
            currentLight = .yellow
        case .yellow:
            yellowOpacity = 0.3
            greenOpacity = 0.9
            currentLight = .green
        case .green:
            greenOpacity = 0.3
            redOpacity = 0.9
            currentLight = .red
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
