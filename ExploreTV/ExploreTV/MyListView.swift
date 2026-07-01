import SwiftUI

/// Écran Ma liste (maquette ExploreTV) : contenus enregistrés ou état vide.
struct MyListView: View {
    @EnvironmentObject var favorites: FavoritesStore
    var onExplore: (() -> Void)? = nil

    private var favoriteItems: [MediaItem] {
        SampleData.allMedia.filter { favorites.isFavorite($0) }
    }

    private var countLabel: String {
        let n = favoriteItems.count
        if n == 0 { return "Aucun contenu enregistré" }
        let s = n > 1 ? "s" : ""
        return "\(n) contenu\(s) enregistré\(s)"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Ma liste")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundStyle(.white)
                        Text(countLabel)
                            .font(.system(size: 13))
                            .foregroundStyle(Theme.textMuted)
                            .padding(.top, 5)

                        if favoriteItems.isEmpty {
                            emptyState
                        } else {
                            list
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    // MARK: - État vide

    private var emptyState: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Theme.accentBlue2.opacity(0.12))
                    .overlay(RoundedRectangle(cornerRadius: 24).stroke(Theme.accentBlue2.opacity(0.3), lineWidth: 1))
                Image(systemName: "bookmark")
                    .font(.system(size: 32))
                    .foregroundStyle(Theme.accentBlue2)
            }
            .frame(width: 78, height: 78)

            Text("Votre liste est vide")
                .font(.system(size: 19, weight: .bold))
                .foregroundStyle(Theme.textPrimary)
                .padding(.top, 20)

            Text("Ajoutez des documentaires, voyages et courts-métrages pour les retrouver ici.")
                .font(.system(size: 14))
                .foregroundStyle(Theme.textMuted)
                .multilineTextAlignment(.center)
                .lineSpacing(2)
                .padding(.top, 8)

            Button(action: { onExplore?() }) {
                HStack(spacing: 8) {
                    Text("Explorer le catalogue")
                }
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal, 22)
                .frame(height: 46)
                .background(Theme.buttonGradient)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .buttonStyle(.plain)
            .padding(.top, 22)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 90)
        .padding(.horizontal, 4)
    }

    // MARK: - Liste

    private var list: some View {
        LazyVStack(spacing: 11) {
            ForEach(favoriteItems) { item in
                NavigationLink(destination: DetailView(item: item)) {
                    HStack(spacing: 13) {
                        PosterArtworkView(item: item)
                            .frame(width: 64, height: 90)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                        VStack(alignment: .leading, spacing: 3) {
                            Text(item.title)
                                .font(.system(size: 15.5, weight: .bold))
                                .foregroundStyle(Theme.textStrong)
                            Text(item.cat.uppercased())
                                .font(.system(size: 11, weight: .bold))
                                .tracking(0.5)
                                .foregroundStyle(Theme.categoryTint)
                            Text("\(item.year) • \(item.duration)")
                                .font(.system(size: 12))
                                .foregroundStyle(Theme.textMuted)
                                .padding(.top, 3)
                        }

                        Spacer(minLength: 0)

                        Image(systemName: "chevron.right")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Theme.chevronMuted)
                    }
                    .padding(9)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white.opacity(0.04))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.07), lineWidth: 1))
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.top, 18)
    }
}

#Preview {
    MyListView()
        .environmentObject(FavoritesStore())
}
