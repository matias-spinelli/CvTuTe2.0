//
//  SkillCardView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 23/09/2025.
//

import SwiftUI

struct SkillCardView: View {
    let skill: Skill

    var body: some View {
        VStack(spacing: 16) {
            SkillBadgeView(skill: skill, enableFlip: false)
                .frame(width: 120, height: 120)
                .frame(maxWidth: .infinity, alignment: .center)

            Text(skill.name)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 4)
                .padding(.bottom, 8)
                .lineLimit(2)
                .minimumScaleFactor(0.7)
        }
        .frame(width: 170, height: 200)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    let skills = SkillsViewModel().skills
    let skill = skills[0]
    SkillCardView(skill: skill)
}
