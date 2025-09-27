//
//  TrailingIconLabelStyle.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            Spacer()
            configuration.icon
        }
    }
}
#Preview {
    Label("Settings", systemImage: "gear")
        .labelStyle(TrailingIconLabelStyle())
        .padding()
}
