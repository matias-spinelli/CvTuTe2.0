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

        ScreenContainer(title: "contact_title", scrollable: false) {
            
            VStack(spacing: 8) {

                List(viewModel.contactos) { contacto in
                    ContactoRow(contacto: contacto)
                }
                .listStyle(.insetGrouped)
            }
        }
    }
}

#Preview {
    ContactoView()
}
