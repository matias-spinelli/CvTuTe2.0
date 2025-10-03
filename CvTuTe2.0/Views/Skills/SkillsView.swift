//
//  SkillsView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct SkillsView: View {
    @State private var selectedCategory: String = ""
    @State private var selectedSkill: Skill? = nil
    @EnvironmentObject var portfolioViewModel: PortfolioViewModel

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {

        VStack {

            TitleView(text: "skills_title")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(portfolioViewModel.skillsViewModel.categories(), id: \.self) { category in
                        CategoryChipView(
                            category: category,
                            isSelected: selectedCategory == category
                        ) {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(portfolioViewModel.skillsViewModel.skills(for: selectedCategory)) { skill in
                        SkillCardView(skill: skill)
                            .onTapGesture {
                                selectedSkill = skill
                            }
                    }
                }
                .padding()
            }
        }

        .sheet(item: $selectedSkill) { skill in
            SkillDetailView(skill: skill)
        }
        
        .onAppear {
            if let firstCategory = portfolioViewModel.skillsViewModel.categories().first {
                selectedCategory = firstCategory
            }
        }
    }
}

#Preview {
    SkillsView()
        .environmentObject(PortfolioViewModel())
}
