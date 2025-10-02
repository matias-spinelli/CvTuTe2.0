//
//  PortfolioViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 30/09/2025.
//

import Foundation
import Combine

class PortfolioViewModel: ObservableObject {
    @Published var skillsViewModel = SkillsViewModel()
    @Published var experienciasViewModel = ExperienciasViewModel()

    func projects(for skill: Skill) -> [Proyecto] {
        experienciasViewModel.experiencias.flatMap { exp in
            exp.proyectos.filter { ($0.skills ?? []).contains(skill.name) }
        }
    }

    func cursos(for skill: Skill) -> [Curso] {
        experienciasViewModel.experiencias
            .flatMap { $0.cursos ?? [] }
            .filter { ($0.skills ?? []).contains(skill.name) }
    }
    
    func totalExperience(for skill: Skill) -> String {
        var totalMonths = 0
        
        for exp in experienciasViewModel.experiencias {
            let projs = exp.proyectos.filter { ($0.skills ?? []).contains(skill.name) }
            totalMonths += DateHelper.totalMonths(fromProjects: projs)
            
            if (exp.skills ?? []).contains(skill.name),
               exp.proyectos.allSatisfy({ ($0.skills ?? []).isEmpty }) {
                totalMonths += DateHelper.totalMonths(from: exp.fechaInicio, to: exp.fechaFin)
            }
        }
        
        return DateHelper.formatDuration(totalMonths: totalMonths)
    }
}
