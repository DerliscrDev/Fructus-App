//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Derlis Ramón Cañete Ríos on 2023-01-25.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Frutus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
