//
//  CategoryChipView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 23/09/2025.
//

import SwiftUI

struct CategoryChipView: View {
    let category: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Text(category)
            .font(.subheadline)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                isSelected
                ? AnyView(Color.tuteBlue.opacity(0.8))
                : AnyView(Color.gray.opacity(0.2))
            )
            .foregroundColor(isSelected ? .white : .primary)
            .cornerRadius(20)
            .onTapGesture(perform: onTap)
    }
}

#Preview {
    CategoryChipView(category: "Programación", isSelected: true, onTap: { })
}
