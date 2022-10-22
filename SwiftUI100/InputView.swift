import SwiftUI

struct InputView: View {
    @State var numberString = ""
    @State var isShownAlert = false
    @State var isShownSheet = false
    
    var body: some View {
        VStack {
            TextField("Input number", text: $numberString)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button {
                if Double(self.numberString) == nil {
                    self.isShownAlert = true
                    return
                }
                self.isShownSheet = true
            } label: {
                Text("Show sheet")
            }
            .alert(isPresented: $isShownAlert) {
                Alert(title: Text("\(self.numberString) cannot convert to Double"))
            }
            .sheet(isPresented: $isShownSheet) {
                Text("\(self.numberString) can convert to Double")
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
