import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var favorites: FavoritesStore

    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        Spacer().frame(height: 32)

                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 88))
                            .foregroundStyle(Color("AccentBlue"))

                        VStack(spacing: 6) {
                            Text("Alex Moreno")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)

                            Text("Membre depuis 2024")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.6))
                        }

                        Divider()
                            .overlay(.white.opacity(0.2))
                            .padding(.horizontal, 32)

                        VStack(spacing: 16) {
                            HStack {
                                Text("Favoris")
                                    .foregroundStyle(.white.opacity(0.8))
                                Spacer()
                                Text("\(favorites.favoriteIDs.count)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("AccentBlue"))
                            }

                            HStack {
                                Text("Contenus regardés")
                                    .foregroundStyle(.white.opacity(0.7))
                                Spacer()
                                Text("12")
                                    .foregroundStyle(.white.opacity(0.7))
                            }

                            HStack {
                                Text("Catégorie préférée")
                                    .foregroundStyle(.white.opacity(0.7))
                                Spacer()
                                Text("Action")
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                        }
                        .padding(.horizontal, 32)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color("AppBackground"), for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(FavoritesStore())
}
