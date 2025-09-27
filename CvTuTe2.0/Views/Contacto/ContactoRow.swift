//
//  ContactoRow.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 27/09/2025.
//

import SwiftUI

struct ContactoRow: View {
    let contacto: Contacto

    var body: some View {
        HStack {
            Image(contacto.image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.trailing, 8)

            Text(contacto.name)
                .font(.headline)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            openLink(contacto.urlLink)
        }
    }

    private func openLink(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    let contactoViewModel = ContactoViewModel()
    let contactos = contactoViewModel.contactos
    ContactoRow(contacto: contactos[2])
}
