//
//  Font+App.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 08/10/2025.
//

import SwiftUI

extension Font {
    struct App {
        
        // Cambiá este nombre si usás una fuente personalizada
        private static let customFontName: String? = nil // ej: "Montserrat"
        
        // MARK: - Display / Titles
        static let largeTitle = font(size: 34, weight: .bold, relativeTo: .largeTitle)
        static let title1     = font(size: 28, weight: .semibold, relativeTo: .title)
        static let title2     = font(size: 22, weight: .semibold, relativeTo: .title2)
        static let title3     = font(size: 20, weight: .medium, relativeTo: .title3)
        
        // MARK: - Body / Paragraphs
        static let body       = font(size: 17, weight: .regular, relativeTo: .body)
        static let callout    = font(size: 16, weight: .regular, relativeTo: .callout)
        static let subheadline = font(size: 15, weight: .medium, relativeTo: .subheadline)
        static let footnote   = font(size: 13, weight: .regular, relativeTo: .footnote)
        static let caption    = font(size: 12, weight: .regular, relativeTo: .caption)
        static let caption2   = font(size: 11, weight: .regular, relativeTo: .caption2)
        
        // MARK: - Private Builder
        private static func font(size: CGFloat, weight: Font.Weight, relativeTo style: TextStyle) -> Font {
            if let name = customFontName {
                // Si definís una fuente custom, la usamos con soporte de Dynamic Type
                return .custom(name, size: size, relativeTo: style).weight(weight)
            } else {
                // Si usás el sistema, devolvemos la font del estilo base (dinámica por naturaleza)
                return .system(style, design: .default).weight(weight)
            }
        }
    }
}
