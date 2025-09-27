//
//  SkillBadgeView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 23/09/2025.
//

import SwiftUI

struct SkillBadgeView: View {
    let skill: Skill
    var enableFlip: Bool = true
    
    @State private var flipped = false
    
    var body: some View {
        ZStack {
            HexagonBadgeView(
                gradient: LinearGradient(
                    colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                Text(skill.description ?? "Detalles")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()
            )
            .rotation3DEffect(.degrees(flipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
            .opacity(flipped ? 1 : 0)

            HexagonBadgeView(gradient: skill.level.gradient)
                .overlay(
                    GeometryReader { geo in
                        Image(skill.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.6)
                            .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 2)
                            .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    }
                )
                .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(flipped ? 0 : 1)
        }
        .modifier(FlipIfEnabled(enableFlip: enableFlip, flipped: $flipped))
    }
}

// MARK: - Flip logic como ViewModifier simple
private struct FlipIfEnabled: ViewModifier {
    var enableFlip: Bool
    @Binding var flipped: Bool
    
    func body(content: Content) -> some View {
        if enableFlip {
            content.onTapGesture {
                withAnimation(.easeInOut(duration: 0.6)) {
                    flipped.toggle()
                }
            }
        } else {
            content
        }
    }
}

#Preview {
    let skills = SkillsViewModel().skills
    let skill = skills[0]
    SkillBadgeView(skill: skill)
}
