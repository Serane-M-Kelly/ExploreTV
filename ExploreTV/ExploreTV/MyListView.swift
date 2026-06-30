import SwiftUI

struct MyListView: View {
    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            Text("Ma liste")
                .foregroundStyle(.white)
                .font(.title)
        }
    }
}

#Preview {
    MyListView()
}
