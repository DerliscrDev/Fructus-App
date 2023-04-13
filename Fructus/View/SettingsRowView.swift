//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Derlis Ramón Cañete Ríos on 2023-01-25.
//

import SwiftUI

struct SettingsRowView: View {
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            
            Divider().padding(.vertical, 4)
            
            HStack {
                Text(name)
                    .foregroundColor(Color.gray)
                Spacer()
                if let content = content {
                    Text(content)
                } else if let linkLabel = linkLabel,
                            let linkDestination = linkDestination {
                    
                    let url = URL(string: "https://\(linkDestination)")!
                    
                    Link(linkLabel, destination: url)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Joh/Jane")
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            
            SettingsRowView(name: "Website", linkLabel: "Swift UI Masterclass", linkDestination: "swiftuimasterclass.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
