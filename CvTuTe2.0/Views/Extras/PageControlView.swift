import SwiftUI

struct PageControlView: View {
    let totalPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.tuteBlue : Color.gray.opacity(0.5))
                    .frame(width: 10, height: 10)
                    .onTapGesture {
                        withAnimation {
                            currentPage = index
                        }
                    }
            }
        }
        .padding(.top, 12)
    }
}

#Preview {
    StatefulPreviewWrapper(1) { currentPage in
        PageControlView(totalPages: 3, currentPage: currentPage)
    }
}
