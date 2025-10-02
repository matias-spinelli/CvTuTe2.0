//
//  TechTalk.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 01/10/2025.
//

import Foundation

struct TechTalk: Codable, Identifiable {
    var id = UUID()
    let titulo: String
    let skill: String?
    let descripcion: String?
    let link: String?
    
    private enum CodingKeys: String, CodingKey {
        case titulo, skill, descripcion, link
    }
    
    init(
        titulo: String,
        skill: String? = nil,
        descripcion: String? = nil,
        link: String? = nil
    ) {
        self.titulo = titulo
        self.skill = skill
        self.descripcion = descripcion
        self.link = link
    }
}
