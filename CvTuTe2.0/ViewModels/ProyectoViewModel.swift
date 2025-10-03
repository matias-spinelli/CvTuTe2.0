//
//  ProyectoViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 02/10/2025.
//

import Foundation
import Combine

class ProyectoViewModel: ObservableObject {
    @Published var proyectos: [Proyecto] = []
    
    init() {
        loadProyectos()
    }
    
    private func loadProyectos() {
        if let data: [Proyecto] = JSONLoader.load("proyectos", as: [Proyecto].self) {
            self.proyectos = data
        }
    }
}

