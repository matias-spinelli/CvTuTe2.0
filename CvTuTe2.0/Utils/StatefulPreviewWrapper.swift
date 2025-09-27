//
//  StatefulPreviewWrapper.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 27/09/2025.
//

import SwiftUI

/// Helper para poder probar interacciones en previews con `@State`.
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content

    init(_ value: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(wrappedValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
