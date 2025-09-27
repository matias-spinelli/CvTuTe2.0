//
//  ZoomableImageView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 25/09/2025.
//

import SwiftUI

struct ZoomableImageView: View {
    let imageName: String
    var onDismiss: (() -> Void)? = nil
    
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    
    @State private var dragOffset: CGFloat = 0
    @State private var backgroundOpacity: Double = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .opacity(backgroundOpacity)
                    .ignoresSafeArea()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .offset(y: dragOffset)
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .clipped()
                    // Pinch-to-zoom
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                scale = lastScale * value
                            }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    if scale < 1 { scale = 1 }
                                    if scale > 4 { scale = 4 }
                                    lastScale = scale
                                }
                            }
                    )
                    // Swipe down (solo en escala 1)
                    .simultaneousGesture(
                        DragGesture()
                            .onChanged { value in
                                guard scale == 1 else { return }
                                dragOffset = value.translation.height
                                // Fondo dinámico: más arrastre, más transparente
                                backgroundOpacity = Double(
                                    max(0.3, 1 - abs(dragOffset) / 300)
                                )
                            }
                            .onEnded { value in
                                guard scale == 1 else { return }
                                if abs(value.translation.height) > 150 {
                                    // cerrar con swipe
                                    onDismiss?()
                                } else {
                                    // volver al centro
                                    withAnimation(.spring()) {
                                        dragOffset = 0
                                        backgroundOpacity = 1.0
                                    }
                                }
                            }
                    )
                    // Double tap con efecto bounce
                    .simultaneousGesture(
                        TapGesture(count: 2)
                            .onEnded {
                                withAnimation(.spring(response: 0.25, dampingFraction: 0.5)) {
                                    if scale > 1 {
                                        scale = 1
                                        lastScale = 1
                                    } else {
                                        scale = 2.2 // un poquito más
                                        lastScale = 2.2
                                    }
                                }
                                if scale > 1 {
                                    // rebote hacia 2x
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                            scale = 2
                                            lastScale = 2
                                        }
                                    }
                                }
                            }
                    )
            }
        }
    }
}
