//
//  ProyectoDetailView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct ProyectoDetailView: View {
    let proyecto: Proyecto
    @EnvironmentObject var portfolioViewModel: PortfolioViewModel

    var body: some View {
        ScrollView {
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
                
                // MARK: - Duración
                if !proyecto.periodo.isEmpty {
                    Text(proyecto.periodo)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // MARK: - Skills por categoría
                ForEach(portfolioViewModel.groupedSkills(for: proyecto), id: \.category) { group in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(group.category)
                            .font(.title3.bold())
                            .foregroundColor(.tuteBlue)
                            .padding(.leading, 8)
                    
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(group.skills) { skill in
                                    SkillItemCard(
                                        imageName: skill.image,
                                        title: skill.name
                                    )
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.container, edges: [])
    }
}


#Preview {
    let portfolioViewModel = PortfolioViewModel()
    let experienciasViewModel = portfolioViewModel.experienciasViewModel
    let experiencias = experienciasViewModel.experiencias
    let experiencia = experiencias[0]
    let proyectos = portfolioViewModel.proyectos(for: experiencia)
    ProyectoDetailView(proyecto: proyectos[0])
        .environmentObject(PortfolioViewModel())
}
