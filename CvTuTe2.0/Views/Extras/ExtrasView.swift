//
//  ExtrasView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 24/09/2025.
//

import SwiftUI

struct ExtrasView: View {
    @EnvironmentObject var portfolioViewModel: PortfolioViewModel
    @StateObject private var extrasViewModel = ExtrasViewModel()
    @StateObject private var envelopeViewModel = EnvelopeViewModel()

    @State private var selectedExtra: Extra?
    
    @State private var currentExtrasPage: Int = 0
    @State private var currentEnvelopesPage: Int = 0
    
    var body: some View {

        VStack(spacing: 8) {

            TitleView(text: "extras_title")

            Spacer()
            
            ExtrasCarousel(
                extras: extrasViewModel.extras,
                currentPage: $currentExtrasPage
            ) { extra in
                selectedExtra = extra
            }

            PageControlView(
                totalPages: extrasViewModel.extras.count,
                currentPage: $currentExtrasPage
            )
            .padding(.top, 12)

            EnvelopesCarousel(
                envelopes: envelopeViewModel.envelopes,
                currentPage: $currentEnvelopesPage
            )

            PageControlView(
                totalPages: envelopeViewModel.envelopes.count,
                currentPage: $currentEnvelopesPage
            )
            .padding(.top, 12)


            Spacer()
        }
        .onAppear {
            extrasViewModel.loadExtras(with: portfolioViewModel.experienciasViewModel.experiencias)
        }
        .fullScreenCover(item: $selectedExtra) { extra in
            FullscreenImageView(extra: extra)
        }
    }
}


#Preview {
    ExtrasView()
        .environmentObject(PortfolioViewModel())
}
