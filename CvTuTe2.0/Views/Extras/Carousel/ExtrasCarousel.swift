//
//  ExtrasCarousel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 29/09/2025.
//

import SwiftUI

struct ExtrasCarousel: View {
    let extras: [Extra]
    @Binding var currentPage: Int
    var onTapExtra: ((Extra) -> Void)? = nil

    var body: some View {
        CarouselSkeletonView(count: extras.count, currentPage: $currentPage) { index in
            let extra = extras[index]

            Image(extra.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 260)
                .clipped()
                .cornerRadius(16)
                .shadow(radius: 5)
                .padding(.horizontal, 16)
                .onTapGesture {
                    onTapExtra?(extra)
                }
        }
        .frame(height: 200)
    }
}


#Preview {
    let experiencias = ExperienciasViewModel().experiencias
    let extrasViewModel = ExtrasViewModel()
    extrasViewModel.loadExtras(with: experiencias)

    return StatefulPreviewWrapper(1) { currentPage in
        ExtrasCarousel(
            extras: extrasViewModel.extras,
            currentPage: currentPage
        )
    }
}
