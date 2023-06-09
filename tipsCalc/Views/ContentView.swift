//
//  ContentView.swift
//  tipsCalc
//
//  Created by danilka on 09.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var money = ""
    
    @State private var currency = 0
    
    @State private var percents = [0, 0.05, 0.1, 0.15, 0.2, 0.25]
    @State private var selectedPercent = 0
    
    var body: some View {
        VStack {
            VStack { //Sum
                Spacer()
                HStack {
                    TextField("123.50", text: $money)
                        .frame(width: calculateWidth(text: money))
                        .font(.system(size: 50))
                    
                    Text(currency == 0 ? "$" : currency == 1 ? "₴" : "€")
                        .onTapGesture {
                            if currency != 2 {
                                currency += 1
                            } else {
                                currency = 0
                            }
                        }
                        .font(.system(size: 50))
                        .offset(CGSize(width: money.isEmpty ? -25 : -7, height: 0))
                }
                .offset(CGSize(width: 10, height: 0))
                Spacer(minLength: 70)
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    .foregroundColor(.bg)
                
                VStack {
                    
                    VStack {
                        VStack {
                            HStack {
                                Text("Выберите процент чаевых")
                                    .foregroundColor(.black.opacity(0.5))
                                    .font(.title3)
                                Spacer()
                            }
                            .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<percents.count) { percent in
                                        Button {
                                            selectedPercent = percent
                                        } label: {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 15)
                                                    .foregroundColor(selectedPercent == percent ? .green : .white)
                                                    .frame(height: 50)
                                                    
                                                Text("\(Int(percents[percent] * 100))%")
                                                    .font(.title)
                                                    .padding(.horizontal, 15)
                                                    .foregroundColor(selectedPercent == percent ? .white : .green)
                                            }
                                            .frame(height: 75)
                                            .padding(.horizontal, 5)
                                        }
                                        
                                    }
                                }

                            }
                        } //percentOfTips
                    }
                }
            } //BG
        }
    }
    
    func calculateWidth(text: String) -> CGFloat {
        var minWidth: CGFloat {
            if text.isEmpty {
                return 175
            }
            else {
                return 0
            }
        }
        let maxWidth: CGFloat = 250
        let textWidth = text.widthOfString(usingFont: .systemFont(ofSize: 50))
        
        return max(minWidth, min(textWidth + 3, maxWidth))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
