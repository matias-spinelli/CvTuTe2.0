//
//  EnvelopesCarousel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 29/09/2025.
//

import SwiftUI

struct EnvelopesCarousel: View {
    let envelopes: [Envelope]
    @Binding var currentPage: Int

    var body: some View {
        CarouselSkeletonView(count: envelopes.count, currentPage: $currentPage) { index in
            let envelope = envelopes[index]

            EnvelopeCardView(
                text: envelope.text
            )
        }
        .frame(height: 240)
        .padding(.vertical, 8)
    }
}


#Preview {
    let envelopes = EnvelopeViewModel().envelopes
    StatefulPreviewWrapper(1) { currentPage in
        EnvelopesCarousel(
            envelopes: envelopes,
            currentPage: currentPage
        )
    }
}
