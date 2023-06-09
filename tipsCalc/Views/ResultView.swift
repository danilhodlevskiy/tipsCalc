//
//  ResultView.swift
//  tipsCalc
//
//  Created by danilka on 09.06.2023.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var showResult: Bool
    var currency: Int
    var result: Double
    
    var body: some View {
        
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.green)
                    .frame(width: 350, height: 500)
                VStack {
                    Text("На каждого человека")
                        .foregroundColor(.bg)
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Text("\(NSString(format: "%.2f", result))")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .fontWeight(.semibold)
                        
                        Text(currency == 0 ? "$" : currency == 1 ? "₴" : "€")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                        
                        
                    }
                }
                .offset(CGSize(width: 0, height: -125))
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 300)
                    .offset(CGSize(width: 0, height: 100))
                
                
                Button {
                    showResult = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 175, height: 50)
                            .foregroundColor(.bg)
                        Text("Пересчитать")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    
                }
                .offset(CGSize(width: 0, height: 200))
                
            }
            
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(showResult: .constant(true), currency: 0, result: 0)
    }
}
