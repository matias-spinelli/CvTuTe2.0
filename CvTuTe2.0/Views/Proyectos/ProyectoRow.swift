//
//  ProyectoRow.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct ProyectoRow: View {
    let proyecto: Proyecto

    var body: some View {
        HStack {
            Image(proyecto.image)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            Text(proyecto.name)
                .font(.subheadline)
        }
    }
}

#Preview {
    let portfolioViewModel = PortfolioViewModel()
    let experienciasViewModel = portfolioViewModel.experienciasViewModel
    let experiencias = experienciasViewModel.experiencias
    let experiencia = experiencias[0]
    let proyectos = portfolioViewModel.proyectos(for: experiencia)
    ProyectoRow(proyecto: proyectos[0])
}
