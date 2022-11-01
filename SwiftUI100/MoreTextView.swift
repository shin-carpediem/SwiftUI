import SwiftUI

struct MoreTextView: View {
    @State var text: String
    @State private var textHeight: CGFloat? = nil
    @State private var isTextFold = false
    @State private var isShownFoldButton = true
    
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
                        if !self.isTextFold {
                            if textSize.height > 80 {
                                self.textHeight = 80
                                self.isTextFold = true
                            } else {
                                self.isShownFoldButton = false
                            }
                        }
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
