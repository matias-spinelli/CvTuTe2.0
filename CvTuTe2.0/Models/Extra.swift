//
//  Extra.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 24/09/2025.
//

import Foundation

struct Extra: Identifiable, Decodable {
    let id = UUID()
    let imageName: String
    let description: String
    let empresa: String
    
    var experienciaLaboral: ExperienciaLaboral?
    
    private enum CodingKeys: String, CodingKey {
        case imageName, description, empresa
        
    }
}
