import SwiftUI

struct TextViewInVStack: View {
    @State var text: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("ラベル")
                    .padding(.bottom, 20)
                TextField("", text: $text)
                    .padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(lineWidth: 2)
                    )
            }
            .padding(20)
            .background(Color.gray.opacity(0.2))
        }
    }
}

struct TextViewInVStack_Previews: PreviewProvider {
    static var previews: some View {
        TextViewInVStack()
    }
}
