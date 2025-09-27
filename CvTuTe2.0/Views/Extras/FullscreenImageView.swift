//
//  FullscreenImageView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 25/09/2025.
//

import SwiftUI

struct FullscreenImageView: View {
    let extra: Extra
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZoomableImageView(imageName: extra.imageName) {
                dismiss()
            }
            .ignoresSafeArea()
            
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    let experiencias = ExperienciasViewModel().experiencias
    let extrasViewModel = ExtrasViewModel()
    extrasViewModel.loadExtras(with: experiencias)
    return FullscreenImageView(extra: extrasViewModel.extras[0])
}
