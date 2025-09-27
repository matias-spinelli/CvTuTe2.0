//
//  HexagonBadgeShapeView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 23/09/2025.
//

import SwiftUI

struct HexagonBadgeShapeView: View {
    let gradient: LinearGradient
    
    var body: some View {
        ZStack {

            HexagonShape()
                .fill(gradient)
            
            HexagonShape()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.95),
                            Color.gray.opacity(0.9),
                            Color.black.opacity(0.7),
                            Color.gray.opacity(0.7),
                            Color.white.opacity(0.9)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 6
                )
            

            HexagonShape()
                .stroke(Color.white.opacity(0.8), lineWidth: 2)
                .blur(radius: 1)
                .blendMode(.screen)
            

            HexagonShape()
                .fill(
                    LinearGradient(
                        colors: [Color.white.opacity(0.25), Color.clear],
                        startPoint: .top,
                        endPoint: .center
                    )
                )
                .clipShape(HexagonShape())
        }
        .shadow(color: .black.opacity(0.5), radius: 6, x: 2, y: 4)
    }
}

struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let inset: CGFloat = 0.05
        
        return Path { p in
            p.move(to: CGPoint(x: w * 0.5, y: 0))
            p.addLine(to: CGPoint(x: w * (1 - inset), y: h * 0.25))
            p.addLine(to: CGPoint(x: w * (1 - inset), y: h * 0.75))
            p.addLine(to: CGPoint(x: w * 0.5, y: h))
            p.addLine(to: CGPoint(x: w * inset, y: h * 0.75))
            p.addLine(to: CGPoint(x: w * inset, y: h * 0.25))
            p.closeSubpath()
        }
    }
}

#Preview {
    HexagonBadgeShapeView(gradient: LinearGradient(colors: [Color.tuteBlue, Color.bocaYellow], startPoint: .topLeading, endPoint: .bottomTrailing))
}
