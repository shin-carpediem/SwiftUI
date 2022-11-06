import SwiftUI

struct NavigationsView: View {
    let fruits = ["A", "B", "C", "D", "E"]
    
    var body: some View {
        NavigationView {
            List(fruits, id: \.self) { fruit in
                NavigationLink(destination: NextView(fruit: fruit)) {
                    Text(fruit)
                }
            }
        }
    }
}

struct NavigationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationsView()
    }
}
