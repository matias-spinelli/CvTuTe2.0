//
//  ExperienciasViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 20/09/2025.
//

import Foundation
import Combine

class ExperienciasViewModel: ObservableObject {
    @Published var experiencias: [ExperienciaLaboral] = []
    
    init() {
        loadExperiencias()
    }
    
    private func loadExperiencias() {
        if let data: [ExperienciaLaboral] = JSONLoader.load("experiencias", as: [ExperienciaLaboral].self) {
            self.experiencias = data
        }
    }
}
