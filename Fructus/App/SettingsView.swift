//
//  SettingsView.swift
//  Fructus
//
//  Created by Derlis Ramón Cañete Ríos on 2023-01-25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.isPresented) var isPresented
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    GroupBox(content: {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 20) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are sources of many, essential nutrients, including potassium, dietary fiber, vitamins and much more.")
                                .font(.footnote)
                            
                        }
                    }, label: {
                        SettingsLabelView(labelText: "Frutus", labelImage: "info.circle")
                    })
                    
                    GroupBox(content: {
                        Divider().padding(.vertical, 4)
                        
                        Text("If you wish, you can restart the application by toogle the switch in this box. That way is starts the onboarding process and you will see the welcome screen again.")
                            .font(.footnote)
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                            .padding()
                            .background(
                                Color(UIColor.tertiarySystemBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            )
                    }, label: {
                        SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    })
                    
                    GroupBox(content: {}, label: {
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                        
                        SettingsRowView(name: "Developer", content: "Derlis Cañete")
                        SettingsRowView(name: "Compatibility", content: "iOS 15")
                        SettingsRowView(name: "Version", content: "1.0.1")
                    })
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        dismiss.callAsFunction()
                    }, label: {
                        Image(systemName: "xmark")
                    })
            )
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
        
    }
}
