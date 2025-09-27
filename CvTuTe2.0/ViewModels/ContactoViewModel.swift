//
//  ContactoViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 27/09/2025.
//

import Foundation
import Combine

final class ContactoViewModel: ObservableObject {
    @Published var contactos: [Contacto] = []

    init() {
        loadContactos()
    }

    private func loadContactos() {
        contactos = [
            Contacto(name: "GitHub", image: "github", urlLink: "https://github.com/matias-spinelli"),
            Contacto(name: "LinkedIn", image: "linkedin", urlLink: "https://ar.linkedin.com/in/matias-spinelli-17655835"),
            Contacto(name: "Email", image: "gmail", urlLink: "mailto:matias@spinelli.com")
        ]
    }
}
