import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            Text("Profil")
                .foregroundStyle(.white)
                .font(.title)
        }
    }
}

#Preview {
    ProfileView()
}
