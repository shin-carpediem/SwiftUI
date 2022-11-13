import SwiftUI

struct PickerView: View {
    var targetList = ["A", "B", "C", "D"]
    
    var body: some View {
        HStack {
            Text("Target")
            Spacer()
            Picker("Target", selection: $selectedTarget) {
                ForEach(0 ..< targetList.count) {
                    Text(self.targetList[$0])
                }
            }
            .pickerStyle(WheelPickerStyle())
            .onReceive([self.selectedTarget].publisher.first()) { selectedIndex in
                print("selectedTarget: \(selectedIndex)")
                print(self.targetList[selectedIndex])
            }
        }
        .padding(16)
    }
    
    /// - Private
    
    @State private var selectedTarget = 0
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
