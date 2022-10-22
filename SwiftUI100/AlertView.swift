import SwiftUI

struct AlertView: View {
    @State var isShownAlert = false
    
    var body: some View {
        Button {
            self.isShownAlert = true
        } label: {
            Text("Push me!")
        }
        .alert(isPresented: self.$isShownAlert) {
            Alert(
                title: Text("Title"),
                message:  Text("Message"),
                primaryButton:  .default(Text("Button 1")),
                secondaryButton: .destructive(Text("Button 2"))
            )
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
