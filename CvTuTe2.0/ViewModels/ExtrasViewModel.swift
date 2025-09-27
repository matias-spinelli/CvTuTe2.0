//
//  ExtrasViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 24/09/2025.
//

import Foundation
import Combine

class ExtrasViewModel: ObservableObject {
    @Published var extras: [Extra] = []

    func loadExtras(with experiencias: [ExperienciaLaboral]) {
        if let loaded: [Extra] = JSONLoader.load("extras", as: [Extra].self) {
            self.extras = loaded.map { extra in
                var mutableExtra = extra
                mutableExtra.experienciaLaboral = experiencias.first { $0.empresa == extra.empresa }
                return mutableExtra
            }
        } else {
            print("⚠️ No se pudieron cargar los extras.")
        }
    }
}
