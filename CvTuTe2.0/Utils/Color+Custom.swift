//
//  Color+Custom.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 21/09/2025.
//

import SwiftUI

extension Color {
    static let bocaBlue = Color(red: 0/255, green: 41/255, blue: 125/255)   // #00297D
    static let bocaYellow = Color(red: 252/255, green: 252/255, blue: 23/255) // #FCFC17
    static let tuteBlue = Color(red: 0/255, green: 150/255, blue: 255/255) // #FCFC17

    static let bocaGradient = LinearGradient(
        colors: [.bocaBlue, .bocaYellow],
        startPoint: .leading,
        endPoint: .trailing
    )
}
