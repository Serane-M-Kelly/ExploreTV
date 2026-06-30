import SwiftUI

struct MyListView: View {
    @EnvironmentObject var favorites: FavoritesStore

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var favoriteItems: [MediaItem] {
        SampleData.allMedia.filter { favorites.isFavorite($0) }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                if favoriteItems.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "heart")
                            .font(.system(size: 56))
                            .foregroundStyle(.white.opacity(0.5))
                        Text("Aucun favori pour l'instant")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.6))
                        Text("Ajoute des contenus depuis leur fiche détail")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.5))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 32)
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(favoriteItems) { item in
                                NavigationLink(destination: DetailView(item: item)) {
                                    ContentCard(item: item)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 24)
                    }
                }
            }
            .navigationTitle("Ma liste")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color("AppBackground"), for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    MyListView()
        .environmentObject(FavoritesStore())
}
