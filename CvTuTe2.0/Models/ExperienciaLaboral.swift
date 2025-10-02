//
//  ExperienciaLaboral.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 20/09/2025.
//

import Foundation

struct ExperienciaLaboral: Codable, Identifiable {
    let id = UUID()
    let empresa: String
    let cliente: String?
    var fechaInicio: String?
    var fechaFin: String?
    let image: String
    var proyectos: [Proyecto]
    let skills: [String]?
    let cursos: [Curso]?
    var techTalks: [TechTalk]?

    private enum CodingKeys: String, CodingKey {
        case empresa, cliente, fechaInicio, fechaFin, image, proyectos, skills, cursos, techTalks
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.empresa = try container.decode(String.self, forKey: .empresa)
        self.cliente = try container.decodeIfPresent(String.self, forKey: .cliente)
        self.fechaInicio = try container.decodeIfPresent(String.self, forKey: .fechaInicio)
        self.fechaFin = try container.decodeIfPresent(String.self, forKey: .fechaFin)
        self.image = try container.decode(String.self, forKey: .image)
        self.proyectos = try container.decode([Proyecto].self, forKey: .proyectos)
        self.skills = try container.decodeIfPresent([String].self, forKey: .skills)
        self.cursos = try container.decodeIfPresent([Curso].self, forKey: .cursos)
        self.techTalks = try container.decodeIfPresent([TechTalk].self, forKey: .techTalks)

        if self.fechaInicio == nil {
            self.fechaInicio = proyectos.first?.fechaInicio
        }
        if self.fechaFin == nil {
            self.fechaFin = proyectos.first?.fechaFin
        }
        
        self.proyectos = self.proyectos.map { proyecto in
            var copy = proyecto
            if copy.fechaInicio == nil {
                copy.fechaInicio = self.fechaInicio
            }
            if copy.fechaFin == nil {
                copy.fechaFin = self.fechaFin
            }
            return copy
        }
    }
    
    var periodo: String {
        let inicio = DateHelper.formatMonthYear(DateHelper.parse(fechaInicio)) ?? ""
        let fin = DateHelper.formatMonthYear(DateHelper.parse(fechaFin)) ?? "Actualidad"
        return "\(inicio) - \(fin)"
    }
    
    var duracion: String {
        DateHelper.duration(
            from: DateHelper.parse(fechaInicio),
            to: DateHelper.parse(fechaFin)
        )
    }
}

// PARA TEST
extension ExperienciaLaboral {
    init(
        empresa: String,
        cliente: String? = nil,
        fechaInicio: String? = nil,
        fechaFin: String? = nil,
        image: String,
        proyectos: [Proyecto] = [],
        skills: [String]? = nil,
        cursos: [Curso]? = nil,
        techTalks: [TechTalk]? = nil
    ) {
        self.empresa = empresa
        self.cliente = cliente
        self.fechaInicio = fechaInicio
        self.fechaFin = fechaFin
        self.image = image
        self.proyectos = proyectos
        self.skills = skills
        self.cursos = cursos
        self.techTalks = techTalks
        
        self.proyectos = proyectos.map { proyecto in
            var copy = proyecto
            if copy.fechaInicio == nil { copy.fechaInicio = fechaInicio }
            if copy.fechaFin == nil { copy.fechaFin = fechaFin }
            return copy
        }
    }
}
