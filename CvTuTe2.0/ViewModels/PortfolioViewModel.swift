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
    @Published var proyectosViewModel = ProyectoViewModel()
    @Published var cursosViewModel = CursosViewModel()

    func allProjects(for skill: Skill) -> [Proyecto] {
        var result: [Proyecto] = []
        
        for experiencia in experienciasViewModel.experiencias {
            if experiencia.skills == nil || experiencia.skills?.isEmpty == true {
                for proyecto in proyectos(for: experiencia) {
                      if (proyecto.skills ?? []).contains(skill.name) {
                          result.append(proyecto)
                      }
                  }
            } else {
                if experiencia.skills?.contains(skill.name) == true {
                    result.append(contentsOf: proyectos(for: experiencia))
                }
            }
        }
        return result
    }
    
    // MARK: - 🔹 Proyectos por Skill
    func proyectos(for skill: Skill) -> [Proyecto] {
        proyectosViewModel.proyectos.filter { ($0.skills ?? []).contains(skill.name) }
    }

    // MARK: - 🔹 Cursos por Skill
    func cursos(for skill: Skill) -> [Curso] {
        cursosViewModel.cursos.filter { ($0.skills ?? []).contains(skill.name) }
    }

    // MARK: - 🔹 Experiencias por Skill
    func experiencias(for skill: Skill) -> [ExperienciaLaboral] {
        experienciasViewModel.experiencias.filter { ($0.skills ?? []).contains(skill.name) }
    }

    // MARK: - 🔹 Proyectos por Experiencia
    func proyectos(for experiencia: ExperienciaLaboral) -> [Proyecto] {
        proyectosViewModel.proyectos.filter { $0.experienciaLaboral == experiencia.shortName }
    }

    // MARK: - 🔹 Cursos por Experiencia
    func cursos(for experiencia: ExperienciaLaboral) -> [Curso] {
        cursosViewModel.cursos.filter { $0.experienciaLaboral == experiencia.shortName }
    }

    // MARK: - 🔹 Total de experiencia en meses para una Skill
    func totalExperience(for skill: Skill) -> String {
        var totalMonths = 0

        // Experiencias directas
        for exp in experienciasViewModel.experiencias {
            if (exp.skills ?? []).contains(skill.name) {
                totalMonths += DateHelper.totalMonths(from: exp.fechaInicio, to: exp.fechaFin)
            }
        }

        // Proyectos relacionados
        for proyecto in proyectos(for: skill) {
            totalMonths += DateHelper.totalMonths(from: proyecto.fechaInicio, to: proyecto.fechaFin)
        }

        // Cursos relacionados
        for curso in cursos(for: skill) {
            totalMonths += DateHelper.totalMonths(from: curso.fechaInicio, to: curso.fechaFin)
        }

        return DateHelper.formatDuration(totalMonths: totalMonths)
    }
}
