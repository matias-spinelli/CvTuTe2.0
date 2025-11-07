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

    // MARK: - 🔹 Skills por Proyecto
    func skills(for proyecto: Proyecto) -> [Skill] {
        guard let projectSkillNames = proyecto.skills else { return [] }
        let allSkills = skillsViewModel.allSkills()
        return allSkills.filter { projectSkillNames.contains($0.name) }
    }
    
    // MARK: - 🔹 Skills agrupadas por categoría (Proyecto + fallback a Experiencia Laboral)
    func groupedSkills(for proyecto: Proyecto) -> [(category: String, skills: [Skill])] {
        // 1️⃣ Intentamos obtener las skills propias del proyecto
        var allSkills = skills(for: proyecto)
        
        // 2️⃣ Si no hay skills propias, buscamos las de su experiencia laboral padre
        if allSkills.isEmpty,
           let shortName = proyecto.experienciaLaboral,
           let experiencia = experienciasViewModel.experiencias.first(where: { $0.shortName == shortName }),
           let experienciaSkills = experiencia.skills {
            
            allSkills = skillsViewModel.allSkills()
                .filter { experienciaSkills.contains($0.name) }
        }
        
        // 3️⃣ Obtenemos las categorías ordenadas (Programación primero)
        let orderedCategories = skillsViewModel.categories()
        
        // 4️⃣ Agrupamos por categoría (respetando el orden y rank)
        var result: [(category: String, skills: [Skill])] = []
        
        for category in orderedCategories {
            let filtered = allSkills
                .filter { $0.category == category }
                .sorted { $0.level.rank > $1.level.rank }
            
            if !filtered.isEmpty {
                result.append((category: category, skills: filtered))
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
    
    // MARK: - 🔹 Total de experiencia en meses para una Experiencia Laboral
    func totalExperience(for experiencia: ExperienciaLaboral) -> String {
        
        if experiencia.fechaInicio != nil && experiencia.fechaFin != nil {
            return DateHelper.duration(
                from: DateHelper.parse(experiencia.fechaInicio),
                to: DateHelper.parse(experiencia.fechaFin)
            )
        }
        
        var totalMonths = 0

        // Proyectos relacionados
        for proyecto in proyectos(for: experiencia) {
            totalMonths += DateHelper.totalMonths(from: proyecto.fechaInicio, to: proyecto.fechaFin)
        }
            
        return DateHelper.formatDuration(totalMonths: totalMonths)
    }
    
    // MARK: - 🔹 Periodo total para una Experiencia Laboral
    func periodoExperiencia(for experiencia: ExperienciaLaboral) -> String {
        var fechaInicio: Date?
        var fechaFin: Date?
        
        if experiencia.fechaInicio == nil && experiencia.fechaFin == nil {
            for proyecto in proyectos(for: experiencia) {
                guard let inicioProyecto = DateHelper.parse(proyecto.fechaInicio),
                      let finProyecto = DateHelper.parse(proyecto.fechaFin ?? "") else { continue }
                
                if fechaInicio == nil || inicioProyecto < fechaInicio! {
                    fechaInicio = inicioProyecto
                }
                
                if fechaFin == nil || finProyecto > fechaFin! {
                    fechaFin = finProyecto
                }
            }
            
            let inicio = DateHelper.formatMonthYear(fechaInicio) ?? ""
            let fin = DateHelper.formatMonthYear(fechaFin) ?? "Actualidad"
            return "\(inicio) - \(fin)"
        }
        
        return experiencia.periodo
    }
}
