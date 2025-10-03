//
//  ProyectoDetailView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct ProyectoDetailView: View {
    let proyecto: Proyecto
    
    var body: some View {
        VStack(spacing: 24) {

            Text(proyecto.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            

            let size: CGFloat = 180
            Image(proyecto.image)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: size * 0.22))
                .shadow(radius: 10)
            
            if let urlString = proyecto.url,
               let url = URL(string: urlString) {
                Link(destination: url) {
                    Label("gotoAppStore", systemImage: "arrow.up.right.square.fill")
                        .labelStyle(TrailingIconLabelStyle())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
            }
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    let portfolioViewModel = PortfolioViewModel()
    let experienciasViewModel = portfolioViewModel.experienciasViewModel
    let experiencias = experienciasViewModel.experiencias
    let experiencia = experiencias[0]
    let proyectos = portfolioViewModel.proyectos(for: experiencia)
    ProyectoDetailView(proyecto: proyectos[0])
}
