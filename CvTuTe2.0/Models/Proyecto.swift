//
//  Proyecto.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 01/10/2025.
//

import Foundation

struct Proyecto: Codable, Identifiable {
    var id = UUID()
    let name: String
    let image: String
    let url: String?
    let tareas: String?
    var fechaInicio: String?
    var fechaFin: String?
    let skills: [String]?
    let dispositivo: Dispositivo?
    
    private enum CodingKeys: String, CodingKey {
        case name, image, url, tareas, fechaInicio, fechaFin, skills, dispositivo
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

// PARA TEST
extension Proyecto {
    init(
        name: String,
        image: String,
        url: String? = nil,
        tareas: String? = nil,
        fechaInicio: String? = nil,
        fechaFin: String? = nil,
        skills: [String]? = nil,
        dispositivo: Dispositivo? = nil
    ) {
        self.name = name
        self.image = image
        self.url = url
        self.tareas = tareas
        self.fechaInicio = fechaInicio
        self.fechaFin = fechaFin
        self.skills = skills
        self.dispositivo = dispositivo
    }
}
