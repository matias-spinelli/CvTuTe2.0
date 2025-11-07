//
//  SkillProjectsGrid.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 02/10/2025.
//

import SwiftUI

struct SkillProjectsGrid: View {
    let proyectos: [Proyecto]
    let cursos: [Curso]

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                if !proyectos.isEmpty {
                    Section(header: Text("Proyectos · \(proyectos.count)")
                        .font(.title3.bold())
                        .foregroundColor(.tuteBlue)
                        .padding(.leading, 8)
                    ) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(proyectos) { proyecto in
                                SkillItemCard(
                                    imageName: proyecto.image,
                                    title: proyecto.name
                                )
                            }
                        }
                    }
                }

                if !cursos.isEmpty {
                    Section(header: Text("Cursos · \(cursos.count)")
                        .font(.title3.bold())
                        .foregroundColor(.tuteBlue)
                        .padding(.leading, 8)
                    ) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(cursos) { curso in
                                SkillItemCard(
                                    imageName: curso.image,
                                    title: curso.name
                                )
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
        }
    }
}


#Preview {
    let portfolioViewModel = PortfolioViewModel()
    let skilliOS = Skill(name: "iOS")
    let projects = portfolioViewModel.allProjects(for: skilliOS)
    let cursos = portfolioViewModel.cursos(for: skilliOS)
    SkillProjectsGrid(
        proyectos: projects,
        cursos: cursos
    )
    .environmentObject(PortfolioViewModel())
}
