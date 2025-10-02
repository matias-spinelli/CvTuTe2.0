//
//  Curso.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 01/10/2025.
//

import Foundation

struct Curso: Codable, Identifiable {
    var id = UUID()
    let name: String
    let provider: String
    let fechaInicio: String?
    let fechaFin: String?
    let duracion: String?
    let image: String?
    let url: String?
    let skills: [String]?

    private enum CodingKeys: String, CodingKey {
        case name, provider, fechaInicio, fechaFin, duracion, image, url, skills
    }
}
