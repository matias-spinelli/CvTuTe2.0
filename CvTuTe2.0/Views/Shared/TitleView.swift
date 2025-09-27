//
//  TitleView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 25/09/2025.
//

import SwiftUI

struct TitleView: View {
    let text: LocalizedStringKey

    var body: some View {
        Text(text)
            .font(.largeTitle.bold())
            .foregroundColor(.tuteBlue)
            .padding([.top, .leading, .trailing])
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
    }
}

#Preview {
    TitleView(text: "Title")
}
