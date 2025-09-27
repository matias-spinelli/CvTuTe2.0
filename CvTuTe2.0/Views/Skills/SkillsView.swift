//
//  SkillsView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct SkillsView: View {
    @StateObject private var viewModel = SkillsViewModel()
    @State private var selectedCategory: String = ""
    @State private var selectedSkill: Skill? = nil
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.categories(), id: \.self) { category in
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
                    ForEach(viewModel.skills(for: selectedCategory)) { skill in
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
            if let firstCategory = viewModel.categories().first {
                selectedCategory = firstCategory
            }
        }
    }
}

#Preview {
    SkillsView()
}
