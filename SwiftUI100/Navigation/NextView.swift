import SwiftUI

struct NextView: View {
    let fruit: String
    
    var body: some View {
        Text(fruit)
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView(fruit: "A")
    }
}
