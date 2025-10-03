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
    let skills: [String]?
    var techTalks: [TechTalk]?
    let shortName: String

    private enum CodingKeys: String, CodingKey {
        case empresa, cliente, fechaInicio, fechaFin, image, skills, techTalks, shortName
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
