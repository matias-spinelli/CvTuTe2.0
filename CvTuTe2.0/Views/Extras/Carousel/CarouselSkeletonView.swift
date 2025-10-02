//
//  CarouselSkeletonView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 25/09/2025.
//

import SwiftUI

struct CarouselSkeletonView<Content: View>: View {
    let count: Int
    @Binding var currentPage: Int
    let content: (Int) -> Content

    init(count: Int, currentPage: Binding<Int>, @ViewBuilder content: @escaping (Int) -> Content) {
        self.count = count
        self._currentPage = currentPage
        self.content = content
    }

    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                ForEach(0..<max(count, 0), id: \.self) { index in
                    content(index)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            HStack {
                Button(action: {
                    withAnimation {
                        if count > 0 {
                            currentPage = (currentPage - 1 + count) % count
                        }
                    }
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
                .padding(.leading, 24)

                Spacer()

                Button(action: {
                    withAnimation {
                        if count > 0 {
                            currentPage = (currentPage + 1) % count
                        }
                    }
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
                .padding(.trailing, 24)
            }
        }
    }
}

#Preview {
    StatefulPreviewWrapper(0) { currentPage in
        CarouselSkeletonView(count: 4, currentPage: currentPage) { index in
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                VStack {
                    Text("Item \(index)")
                        .font(.headline)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 280)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
