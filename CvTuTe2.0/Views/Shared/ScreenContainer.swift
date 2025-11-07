//
//  ScreenContainer.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 07/10/2025.
//

import SwiftUI

struct ScreenContainer<Content: View>: View {
    var title: LocalizedStringKey?
    var backgroundColor: Color = Color(.systemGroupedBackground)
    var scrollable: Bool = true // 👈 por defecto siempre scroll
    @ViewBuilder var content: () -> Content

    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()

            VStack(spacing: 0) {
                // TITLE
                if let title {
                    TitleView(text: title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 8) // 👈 separacion fija de notch
                        .safeAreaPadding(.top) // respeta notch
                }

                // CONTENT
                Group {
                    if scrollable {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 16) {
                                content()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 60) // espacio para tab bar
                        }
                    } else {
                        VStack(alignment: .leading, spacing: 16) {
                            content()
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 60)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .top) // 👈 prioriza el top
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // 👈 prioridad al top
        }
    }
}

#Preview {
    ScreenContainer(title: "Preview Title") {
        VStack(spacing: 8) {
            ForEach(0..<3) { i in
                Text("Item \(i)")
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 1)
            }
        }
    }
}
