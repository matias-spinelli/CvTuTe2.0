//
//  Proyecto.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 01/10/2025.
//

import Foundation

struct Proyecto: Codable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let url: String?
    let tareas: String?
    var fechaInicio: String?
    var fechaFin: String?
    let skills: [String]?
    let dispositivo: Dispositivo?
    let experienciaLaboral: String?

    private enum CodingKeys: String, CodingKey {
        case name, image, url, tareas, fechaInicio, fechaFin, skills, dispositivo, experienciaLaboral
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

enum Dispositivo: String, Codable {
    case iPhone, iPad, macOS, watchOS, tvOS, multiplataforma
}
