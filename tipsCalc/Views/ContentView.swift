//
//  ContentView.swift
//  tipsCalc
//
//  Created by danilka on 09.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(height: UIScreen.main.bounds.height * 0.65)
                    .foregroundColor(.bg)
            } //BG
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
