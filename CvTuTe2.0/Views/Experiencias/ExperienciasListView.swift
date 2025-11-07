//
//  ExperienciasListView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 20/09/2025.
//

import SwiftUI


struct ExperienciasListView: View {
    @EnvironmentObject var portfolioViewModel: PortfolioViewModel

    var body: some View {
        
        NavigationStack {

            ScreenContainer(title: "experiencias_title") {

                    VStack(alignment: .leading, spacing: 16) {
                                                                
                        HStack(spacing: 8) {
                            Image(systemName: "applelogo")
                                .font(.title2)
                                .foregroundColor(.black)
                            Text("iosdeveloper")
                                .font(.title3)
                                .bold()
                        }
                        .padding(.bottom, 10)
                        
                        ForEach(portfolioViewModel.experienciasViewModel.experiencias) { exp in
                            ExperienciaRow(experiencia: exp)
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

#Preview {
    ExperienciasListView()
        .environmentObject(PortfolioViewModel())
}

