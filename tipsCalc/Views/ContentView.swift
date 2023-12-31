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
    
    @State private var countOfPeople = ""
    @State private var countOfPeopleStep = 2
    
    @State private var showResult = false
    
    @State private var result: Double = 0
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack { //Sum
                    Spacer()
                    HStack {
                        TextField("123.50", text: $money)
                            .frame(width: calculateWidth(text: money, minWidthIfTextIsEmpty: 175, minWindth: 0, maxWidth: 250, fontSize: 50))
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
                                    Text("Оберіть процент чайових")
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
                            
                            VStack {
                                HStack {
                                    Text("Кількість друзів")
                                        .foregroundColor(.black.opacity(0.5))
                                        .font(.title3)
                                        
                                    Spacer()
                                }
                                .padding(.horizontal, 15)
                                
                                HStack {
                                    TextField("\(countOfPeopleStep)", text: $countOfPeople)
                                        .font(.system(size: 50))
                                        .foregroundColor(.green)
                                        .fontWeight(.semibold)
                                        .frame(width: calculateWidth(text: countOfPeople, minWidthIfTextIsEmpty: 65, minWindth: 65, maxWidth: 100, fontSize: 35))
                                        
                                    
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(.green)
                                            Button {
                                                countOfPeopleStep += 1
                                                countOfPeople = "\(countOfPeopleStep)"
                                                
                                            } label: {
                                                Text("+")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(.green)
                                            Button {
                                                if countOfPeopleStep != 1 {
                                                    countOfPeopleStep -= 1
                                                    countOfPeople = "\(countOfPeopleStep)"
                                                }
                                                
                                            } label: {
                                                Text("-")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 25)
                                
                                Spacer()
                                
                                Button {
                                    
                                    if let countOfPeople = Int(countOfPeople) {
                                        if let money = Double(money) {
                                            let forOnePersonWithoutTips = money / Double(countOfPeople)
                                            
                                            result = Double(forOnePersonWithoutTips) + (forOnePersonWithoutTips * Double(percents[selectedPercent]))
                                        }
                                        
                                    }
                                    
                                    showResult = true
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(.green)
                                            .frame(width: 150, height: 50)
                                        Text("Підрахувати")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                    
                                }
                                .padding(.bottom, 30)

                                
                                
                            }
                        }
                    }
                    .padding(.top, 50)
                } //BG
            }
            .blur(radius: showResult ? 100 : 0)
            .animation(.default, value: showResult)
            
            ResultView(showResult: $showResult, currency: currency, result: result)
                .offset(CGSize(width: 0, height: showResult ? 0 : UIScreen.main.bounds.height))
                .animation(.easeInOut(duration: 0.5), value: showResult)
        }
    }
    
    func calculateWidth(text: String, minWidthIfTextIsEmpty: CGFloat, minWindth: CGFloat, maxWidth: CGFloat, fontSize: CGFloat) -> CGFloat {
        var minWidth: CGFloat {
            if text.isEmpty {
                return minWidthIfTextIsEmpty
            }
            else {
                return minWindth
            }
        }
        let maxWidth: CGFloat = maxWidth
        let textWidth = text.widthOfString(usingFont: .systemFont(ofSize: fontSize))
        
        return max(minWidth, min(textWidth + 3, maxWidth))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
