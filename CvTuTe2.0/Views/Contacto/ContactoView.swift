//
//  ContactoView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 24/09/2025.
//

import SwiftUI

struct ContactoView: View {
    @StateObject private var viewModel = ContactoViewModel()

    var body: some View {
        VStack(spacing: 0) {
            TitleView(text: "Contacto")

            List(viewModel.contactos) { contacto in
                ContactoRow(contacto: contacto)
            }
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ContactoView()
}
