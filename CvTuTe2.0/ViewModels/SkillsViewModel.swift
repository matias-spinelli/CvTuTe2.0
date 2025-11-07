//
//  SkillsViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 22/09/2025.
//

import Foundation
import Combine

class SkillsViewModel: ObservableObject {
    @Published var skills: [Skill] = []
    
    init() {
        loadSkills()
    }
    
    private func loadSkills() {
        if let data: [Skill] = JSONLoader.load("habilidades", as: [Skill].self) {
            self.skills = data
        }
    }
    
    func allSkills() -> [Skill] {
        skills.sorted { $0.level.rank > $1.level.rank }
    }
    
    func skills(for category: String) -> [Skill] {
        skills
            .filter { $0.category == category }
            .sorted { $0.level.rank > $1.level.rank }
    }

    func skills(skills:[Skill], category: String) -> [Skill] {
        skills
            .filter { $0.category == category }
            .sorted { $0.level.rank > $1.level.rank }
    }
    
    func categories() -> [String] {
        let allCategories = Array(Set(skills.map { $0.category }))
        
        var sorted = allCategories.filter { $0 != "Programación" }.sorted()
        sorted.insert("Programación", at: 0)
        
        return sorted
    }
}
