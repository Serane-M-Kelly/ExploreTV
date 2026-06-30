import SwiftUI

struct ExploreView: View {
    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            Text("Explorer")
                .foregroundStyle(.white)
                .font(.title)
        }
    }
}

#Preview {
    ExploreView()
}
