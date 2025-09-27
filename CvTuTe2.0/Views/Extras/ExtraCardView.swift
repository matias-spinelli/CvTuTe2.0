//
//  ExtraCardView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 26/09/2025.
//

import SwiftUI

import SwiftUI

struct ExtraCardView: View {
    let extra: Extra
    
    var body: some View {
        Image(extra.imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 260)
            .clipped()
            .cornerRadius(16)
            .shadow(radius: 5)
            .padding(.horizontal, 16)
    }
}


//#Preview {
//    ExtraCardView()
//}
