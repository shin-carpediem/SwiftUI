import SwiftUI

struct SwiftUITabView: View {
    var body: some View {
        TabView {
            ImageView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            NavigationsView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            PickerView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
    }
}

struct SwiftUITabView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITabView()
    }
}
