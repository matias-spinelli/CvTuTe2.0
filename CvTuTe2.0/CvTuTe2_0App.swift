//
//  CvTuTe2_0App.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 20/09/2025.
//

import SwiftUI

@main
struct CvTuTe2_0App: App {
    @StateObject private var experienciasViewModel = ExperienciasViewModel()

    var body: some Scene {
        WindowGroup {
            CustomTabView()
                .environmentObject(experienciasViewModel)
        }
    }
}
