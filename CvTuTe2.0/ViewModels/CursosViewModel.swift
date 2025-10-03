//
//  CursosViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 02/10/2025.
//

import Foundation
import Combine

class CursosViewModel: ObservableObject {
    @Published var cursos: [Curso] = []
    
    init() {
        loadCursos()
    }
    
    private func loadCursos() {
        if let data: [Curso] = JSONLoader.load("cursos", as: [Curso].self) {
            self.cursos = data
        }
    }
}

