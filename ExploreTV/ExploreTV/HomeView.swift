import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            Text("Accueil")
                .foregroundStyle(.white)
                .font(.title)
        }
    }
}

#Preview {
    HomeView()
}
