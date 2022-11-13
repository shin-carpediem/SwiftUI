import SwiftUI

struct CompleteView: View {
    @State var password: String = ""
    
    var body: some View {
        Text("Complete")
            .padding()
            .navigationBarTitle("Complete", displayMode: .automatic)
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
