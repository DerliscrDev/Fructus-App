//
//  ContentView.swift
//  Fructus
//
//  Created by Derlis Ramón Cañete Ríos on 2023-01-23.
//

import SwiftUI

struct ContentView: View {
    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings: Bool = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Fruits")
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            isShowingSettings = true
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                        })
                        .sheet(isPresented: $isShowingSettings, content: {
                            SettingsView()
                        })
                )
            }
            
        } else {
            NavigationView {
                List(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Fruits")
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            isShowingSettings = true
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                        })
                        .sheet(isPresented: $isShowingSettings, content: {
                            SettingsView()
                        })
                )
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
