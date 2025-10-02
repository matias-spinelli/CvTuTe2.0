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

    func allProjects(for skill: Skill) -> [Proyecto] {
        var result: [Proyecto] = []
        
        for experiencia in experienciasViewModel.experiencias {
            if experiencia.skills == nil || experiencia.skills?.isEmpty == true {
                for proyecto in experiencia.proyectos {
                    if (proyecto.skills ?? []).contains(skill.name) {
                        result.append(proyecto)
                    }
                }
            } else {
                if experiencia.skills?.contains(skill.name) == true {
                    result.append(contentsOf: experiencia.proyectos)
                }
            }
        }
        return result
    }
    
    func projects(for skill: Skill) -> [Proyecto] {
        experienciasViewModel.experiencias.flatMap { exp in
            exp.proyectos.filter { ($0.skills ?? []).contains(skill.name) }
        }
    }

    func experienciasLaboral(for skill: Skill) -> [ExperienciaLaboral] {
        experienciasViewModel.experiencias.filter({ ($0.skills ?? []).contains(skill.name) })
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
        
        for curso in experienciasViewModel.experiencias.flatMap({ $0.cursos ?? [] }) {
            if (curso.skills ?? []).contains(skill.name) {
                totalMonths += DateHelper.totalMonths(from: curso.fechaInicio, to: curso.fechaFin)
            }
        }
        
        return DateHelper.formatDuration(totalMonths: totalMonths)
    }

}
