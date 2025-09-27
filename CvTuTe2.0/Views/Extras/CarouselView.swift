//
//  CarouselView.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 25/09/2025.
//

import SwiftUI

struct CarouselView: View {
    
    let extras: [Extra]
    @Binding var currentPage: Int
    var onTapExtra: ((Extra) -> Void)? = nil

    var body: some View {
        ZStack {

            TabView(selection: $currentPage) {
                ForEach(Array(extras.enumerated()), id: \.1.id) { index, extra in
                    Image(extra.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 260)
                        .clipped()
                        .cornerRadius(16)
                        .shadow(radius: 5)
                        .padding(.horizontal, 16)
                        .tag(index)
                        .onTapGesture {
                            onTapExtra?(extra)
                        }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 280)
            
            HStack {
                Button(action: {
                    withAnimation {
                        if currentPage > 0 {
                            currentPage -= 1
                        } else {
                            currentPage = extras.count - 1
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
                        if currentPage < extras.count - 1 {
                            currentPage += 1
                        } else {
                            currentPage = 0
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
            .frame(height: 260)
        }
    }
}

#Preview {
    let experiencias = ExperienciasViewModel().experiencias
    let extrasViewModel = ExtrasViewModel()
    extrasViewModel.loadExtras(with: experiencias)

    return StatefulPreviewWrapper(1) { currentPage in
        CarouselView(
            extras: extrasViewModel.extras,
            currentPage: currentPage
        )
    }
}

