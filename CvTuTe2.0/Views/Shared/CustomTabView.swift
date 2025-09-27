//
//  CustomTabView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI


enum Tab {
    case extras
    case experience
    case about
    case skills
    case contact
}

struct CustomTabView: View {
    @State private var selectedTab: Tab = .about

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTab {
                case .extras:
                    ExtrasView()
                case .experience:
                    ExperienciasListView()
                case .about:
                    AboutView()
                case .skills:
                    SkillsView()
                case .contact:
                    ContactoView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}


// MARK: - Custom Tab Bar
struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea(edges: .bottom)
            
            HStack {

                TabBarButton(
                    icon: "photo.fill.on.rectangle.fill",
                    title: "Extras",
                    isSelected: selectedTab == .extras
                ) {
                    withAnimation(.easeInOut) { selectedTab = .extras }
                }
                
                Spacer()
                
                TabBarButton(
                    icon: "briefcase.fill",
                    title: "Experiencia",
                    isSelected: selectedTab == .experience
                ) {
                    withAnimation(.easeInOut) { selectedTab = .experience }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.6)) {
                        selectedTab = .about
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 72, height: 72)
                            .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 4)
                        
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(selectedTab == .about ? .tuteBlue : .gray)
                    }
                    .overlay(
                        Circle()
                            .stroke(selectedTab == .about ? .tuteBlue : Color.clear, lineWidth: 3)
                            .frame(width: 80, height: 80)
                    )
                }
                .offset(y: -20)
                
                Spacer()
                
                TabBarButton(
                    icon: "hammer.fill",
                    title: "Skills",
                    isSelected: selectedTab == .skills
                ) {
                    withAnimation(.easeInOut) { selectedTab = .skills }
                }
                
                Spacer()
                
                TabBarButton(
                    icon: "envelope.fill",
                    title: "Contacto",
                    isSelected: selectedTab == .contact
                ) {
                    withAnimation(.easeInOut) { selectedTab = .contact }
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 70)
            .padding(.bottom, 20)
        }
        .frame(height: 90)
    }
}

// MARK: - TabBarButton
struct TabBarButton: View {
    var icon: String
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .tuteBlue : .gray)
                Text(title)
                    .font(.caption2)
                    .foregroundColor(isSelected ? .tuteBlue : .gray)
            }
            .frame(maxWidth: 88)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomTabView()
        .environmentObject(ExperienciasViewModel())
}
