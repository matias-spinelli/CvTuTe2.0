//
//  ExtrasView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 24/09/2025.
//

import SwiftUI

struct ExtrasView: View {
    @EnvironmentObject var experienciasViewModel: ExperienciasViewModel
    @StateObject private var viewModel = ExtrasViewModel()
    
    @State private var selectedExtra: Extra?
    @State private var currentPage: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            TitleView(text: "extras_title")
            
            Spacer()
            
            CarouselView(
                extras: viewModel.extras,
                currentPage: $currentPage
            ) { extra in
                selectedExtra = extra
            }

            PageControlView(totalPages: viewModel.extras.count,
                            currentPage: $currentPage)
            .padding(.top, 12)

            Spacer()
        }
        .onAppear {
            viewModel.loadExtras(with: experienciasViewModel.experiencias)
        }
        .fullScreenCover(item: $selectedExtra) { extra in
            FullscreenImageView(extra: extra)
        }
    }
}


#Preview {
    ExtrasView()
        .environmentObject(ExperienciasViewModel())
}
