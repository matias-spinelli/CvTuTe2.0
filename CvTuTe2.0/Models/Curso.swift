//
//  Curso.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 01/10/2025.
//

import Foundation

struct Curso: Codable, Identifiable {
    let id = UUID()
    let name: String
    let provider: String
    let fechaInicio: String?
    let fechaFin: String?
    let image: String?
    let url: String?
    let skills: [String]?
    let experienciaLaboral: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, provider, fechaInicio, fechaFin, image, url, skills, experienciaLaboral
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
