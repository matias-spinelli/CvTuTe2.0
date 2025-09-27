//
//  SkillLevelHelper.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 23/09/2025.
//

import SwiftUI

extension SkillLevel {
    var rank: Int {
        switch self {
        case .diamond: return 5
        case .platinum: return 4
        case .gold: return 3
        case .silver: return 2
        case .bronze: return 1
        }
    }
    
    var color: Color {
        switch self {
        case .diamond: return Color.blue
        case .platinum: return Color.cyan
        case .gold: return Color.yellow
        case .silver: return Color.gray
        case .bronze: return Color.orange
        }
    }
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [.white, color, .black.opacity(0.6)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
