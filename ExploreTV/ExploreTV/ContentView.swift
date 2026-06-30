import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }
            ExploreView()
                .tabItem {
                    Label("Explorer", systemImage: "magnifyingglass")
                }
            MyListView()
                .tabItem {
                    Label("Ma liste", systemImage: "heart.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
        }
        .tint(Color("AccentBlue"))
    }
}

#Preview {
    ContentView()
}
