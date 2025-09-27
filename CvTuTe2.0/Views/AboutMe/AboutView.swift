//
//  AboutView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image("Matias Ezequiel Spinelli Santacruz")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .shadow(radius: 6)
                    .overlay(
                        Circle()
                            .stroke(Color.tuteBlue, lineWidth: 3)
                    )
                
                Text("Matías Spinelli")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 8) {
                    Image(systemName: "applelogo")
                        .foregroundColor(.tuteBlue)
                        .font(.title2)
                    
                    Text("iOS Developer con 14 años de experiencia")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                        .fontWeight(.semibold)
                }
                
                Divider().padding(.vertical)
                
                VStack(alignment: .center, spacing: 16) {
                    Text("👋 ¡Buenos días!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Desarrollé esta app para compartir mi experiencia,\nsseguir aprendiendo con **SwiftUI** y,\npor qué no, divertirme un rato.")
                        .padding(.horizontal)
                    
                    Spacer().frame(height: 8)

                    Text("📂 En esta app vas a poder ver:\n\n- Mi trayectoria profesional\n- Mis habilidades técnicas\n- Y algunos extras 🎉")
                        .padding(.horizontal)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(6)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.bocaYellow.opacity(0.1), Color.bocaBlue.opacity(0.1)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .cornerRadius(16)
                )
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
            }
            .padding()
        }
    }
}

#Preview {
    AboutView()
}
