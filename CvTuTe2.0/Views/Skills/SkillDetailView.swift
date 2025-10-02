//
//  SkillDetailView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 22/09/2025.
//

import SwiftUI

struct SkillDetailView: View {
    let skill: Skill
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var portfolioViewModel: PortfolioViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(.systemBackground).ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                SkillBadgeView(skill: skill, enableFlip: true)
                    .frame(width: 250, height: 250)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(skill.name)
                    .font(.largeTitle.bold())
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)
                    .padding(.horizontal, 16)

                Text(portfolioViewModel.totalExperience(for: skill))
                    .font(.title3.bold())
                    .foregroundColor(.tuteBlue)

                
                SkillProjectsGrid(
                    proyectos: portfolioViewModel.allProjects(for: skill),
                    cursos: portfolioViewModel.cursos(for: skill)
                )

            }
            .padding(.top, 8)

            Button {
               dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}


#Preview {
    let skills = SkillsViewModel().skills
    let skill = skills[0]
    SkillDetailView(skill: skill)
        .environmentObject(PortfolioViewModel())
}
