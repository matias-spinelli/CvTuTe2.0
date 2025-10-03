//
//  SkillItemCard.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 02/10/2025.
//

import SwiftUI

struct SkillItemCard: View {
    let imageName: String?
    let title: String

    var body: some View {
        VStack(spacing: 8) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .cornerRadius(22)
            } else {
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 90, height: 90)
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
            }

            Text(title)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: .infinity)
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}


#Preview {
    SkillItemCard(imageName: "wolox", title: "Wolox")
}
