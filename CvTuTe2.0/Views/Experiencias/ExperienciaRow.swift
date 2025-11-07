//
//  ExperienciaRow.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct ExperienciaRow: View {
    let experiencia: ExperienciaLaboral
    @State private var isExpanded = false
    @EnvironmentObject var portfolioViewModel: PortfolioViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(experiencia.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 6) {

                    Text(experiencia.empresa)
                        .font(.headline)
                    
                    HStack(spacing: 2) {
                        Text(portfolioViewModel.periodoExperiencia(for: experiencia))
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        
                        Text("· \(portfolioViewModel.totalExperience(for: experiencia))")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    
                    if let cliente = experiencia.cliente {
                        Text("Cliente: \(cliente)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                } label: {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.blue)
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(portfolioViewModel.proyectos(for: experiencia)) { proyecto in
                        NavigationLink {
                            ProyectoDetailView(proyecto: proyecto)
                        } label : {
                            ProyectoRow(proyecto: proyecto)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top, 10)
                .padding(.leading, 60)
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}


#Preview {
    let portfolioViewModel = PortfolioViewModel()
    let experiencias = portfolioViewModel.experienciasViewModel.experiencias
    ExperienciaRow(experiencia: experiencias[0])
        .environmentObject(PortfolioViewModel())
}
