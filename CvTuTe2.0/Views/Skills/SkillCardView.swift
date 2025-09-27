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
        VStack {
            if let imageName = skill.image {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .padding(.top, 8)
            }
            
            Text(skill.name)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 4)
                .padding(.bottom, 8)
        }
        .frame(width: 150, height: 160)
        .background(skill.level.gradient)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

#Preview {
    let skills = SkillsViewModel().skills
    let skill = skills[0]
    SkillCardView(skill: skill)
}
