import SwiftUI

struct ImageView: View {
    let size: CGFloat = 42

    var body: some View {
        let image = Image("icon")
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
            .overlay {
                RoundedRectangle(cornerRadius: size / 2).stroke(Color.black, lineWidth: 4)
            }

        HStack {
            image
            Spacer()
            image
            Spacer()
            image
            Spacer()
            image
            Spacer()
            image
        }
        .padding(16)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
