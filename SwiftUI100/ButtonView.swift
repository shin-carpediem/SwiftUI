import SwiftUI

struct ButtonView: View {
    @State var text = "A"
    
    @State var isNavigationActive = false
    
    var body: some View {
        VStack {
            Text(text)
            Button {
                self.text = "B"
            } label: {
                Text("Change text")
            }
            .buttonStyle(.plain)
            Button {
                self.isNavigationActive = true
            } label: {
                Text("Push second view")
            }

            NavigationLink(destination: Text("Second view"), isActive: $isNavigationActive) {
                EmptyView()
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
