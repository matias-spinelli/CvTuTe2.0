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
    let fechaInicio: String
    let fechaFin: String?
    let image: String
    let proyectos: [Proyecto]

    private enum CodingKeys: String, CodingKey {
        case empresa, cliente, fechaInicio, fechaFin, image, proyectos
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

struct Proyecto: Codable, Identifiable {
    var id = UUID()
    let name: String
    let image: String
    let url: String?
    let tareas: String?

    private enum CodingKeys: String, CodingKey {
        case name, image, url, tareas
    }
}
