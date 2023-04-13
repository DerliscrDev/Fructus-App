//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Derlis Ramón Cañete Ríos on 2023-01-23.
//

import SwiftUI

struct FruitDetailView: View {
    var fruit: Fruit
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {
                        
                        FruitHeaderView(fruit: fruit)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text(fruit.title)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(fruit.gradientColors[1])
                            
                            Text(fruit.headline)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            
                            FruitNutrientsView(fruit: fruit)
                            
                            Text("Learn more about \(fruit.title)".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(fruit.gradientColors[1])
                            
                            Text(fruit.description)
                                .multilineTextAlignment(.leading)
                            
                            SourceLinkView()
                                .padding(.top, 10)
                                .padding(.bottom, 40)
                            
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: 640, alignment: .center)
                    }
                }
                .edgesIgnoringSafeArea(.top)
            }
        } else {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {
                        
                        FruitHeaderView(fruit: fruit)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text(fruit.title)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(fruit.gradientColors[1])
                            
                            Text(fruit.headline)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            
                            FruitNutrientsView(fruit: fruit)
                            
                            Text("Learn more about \(fruit.title)".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(fruit.gradientColors[1])
                            
                            Text(fruit.description)
                                .multilineTextAlignment(.leading)
                            
                            SourceLinkView()
                                .padding(.top, 10)
                                .padding(.bottom, 40)
                            
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: 640, alignment: .center)
                    }
                }
                .edgesIgnoringSafeArea(.top)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
