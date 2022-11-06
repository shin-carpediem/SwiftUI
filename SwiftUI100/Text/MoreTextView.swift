import SwiftUI

struct MoreTextView: View {
    @State var text: String
    @State private var textHeight: CGFloat? = nil
    @State private var isTextFold = false
    @State private var isShownFoldButton = true
    
    // なぜこのプロパティがあればうまくいく？
    @State private var isFirst = true
    
    private func updateTextSize(_ textSize: CGSize) {
//        if !self.isTextFold {
        if self.isFirst {
            if textSize.height > 80 {
                self.textHeight = 80
                self.isTextFold = true
                self.isShownFoldButton = true
                
                self.isFirst = false
            } else {
                self.textHeight = nil
                self.isTextFold = false
                self.isShownFoldButton = false
                
                self.isFirst = true
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(text)
                    .frame(height: textHeight)
                    .background(GeometryReader { geometory in
                        Color.clear.preference(key: SizePreference.self, value: geometory.size)
                    })
                    .padding()
                    .onPreferenceChange(SizePreference.self) { textSize in
                        updateTextSize(textSize)
                    }
                Spacer()
            }
            
            if isShownFoldButton {
                Button {
                    self.isTextFold.toggle()
                    self.textHeight = self.isTextFold ? 80 : nil
                } label: {
                    Text(isTextFold ? "More" : "Fold")
                }
                .padding(.trailing, 8)
            }
        }
    }
}

fileprivate struct SizePreference: PreferenceKey {
    static let defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
