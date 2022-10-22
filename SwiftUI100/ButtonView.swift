import SwiftUI

struct ButtonView: View {
    @State var text = "A"
    
    var body: some View {
        VStack {
            Text(text)
            Button {
                self.text = "B"
            } label: {
                Text("Tap me!")
            }
            .buttonStyle(.plain)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
