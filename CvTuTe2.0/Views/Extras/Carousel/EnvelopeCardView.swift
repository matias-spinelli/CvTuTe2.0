//
// EnvelopeCardView.swift
// CvTuTe2.0
//
// Created by Matías Spinelli on 28/09/2025.
//

import SwiftUI

struct EnvelopeCardView: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.tuteBlue, lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 16).fill(Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.tuteBlue.opacity(0.6), lineWidth: 1.5)
                        .padding(6)
                )
                .shadow(radius: 5)
            
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    
                    Image(systemName: "seal.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.tuteBlue)
                        .frame(width: 28, height: 28)
                }
                                
                Text(text)
                    .font(.caption2.italic())
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                
                HStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.tuteBlue)
                        .frame(width: 28, height: 28)
                    
                    Spacer()
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
        }
        .frame(width: 240, height: 240)
    }
}

#Preview {
    let envelopes = EnvelopeViewModel().envelopes
    EnvelopeCardView(
        text: envelopes[0].text
    )
}
