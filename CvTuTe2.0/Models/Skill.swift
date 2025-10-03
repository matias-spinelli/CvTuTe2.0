//
//  Skill.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 22/09/2025.
//

import Foundation

struct Skill: Codable, Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let level: SkillLevel
    let image: String
    let description: String?

    private enum CodingKeys: String, CodingKey {
        case name, category, level, image, description
    }
}

enum SkillLevel: String, Codable {
    case bronze
    case silver
    case gold
    case platinum
    case diamond
    
    private enum CodingKeys: String, CodingKey {
        case bronze, silver, gold, platinum, diamond
    }
}

// PARA TEST
extension Skill {
    init(name: String) {
        self.name = name
        self.category = ""
        self.level = .bronze
        self.image = ""
        self.description = nil
    }
}

