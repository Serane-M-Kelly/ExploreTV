import SwiftUI

/// Grand visuel d'accueil (maquette ExploreTV) : affiche abstraite plein cadre,
/// barre d'app, badge "À LA UNE", titre, méta et boutons Regarder / Ma liste.
struct HeroBannerView: View {
    let item: MediaItem
    @EnvironmentObject var favorites: FavoritesStore

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Visuel abstrait + fondu vers le fond.
            PosterArtworkView(item: item)
                .frame(height: 472)
                .overlay(alignment: .bottom) {
                    LinearGradient(
                        colors: [.clear, Theme.background.opacity(0.7), Theme.background],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 300)
                }
                .overlay(alignment: .top) { appBar }
                .clipped()

            heroContent
        }
        .frame(height: 472)
    }

    // MARK: - Barre d'app

    private var appBar: some View {
        HStack {
            HStack(spacing: 8) {
                ZStack {
                    Circle()
                        .stroke(Theme.accentBlue2, lineWidth: 2)
                        .frame(width: 26, height: 26)
                    Image(systemName: "play.fill")
                        .font(.system(size: 10))
                        .foregroundStyle(Theme.accentBlue2)
                        .offset(x: 1)
                }
                HStack(spacing: 0) {
                    Text("Explore").foregroundStyle(.white)
                    Text("TV").foregroundStyle(Theme.accentBlue2)
                }
                .font(.system(size: 19, weight: .heavy))
            }
            Spacer()
            ZStack {
                Circle()
                    .fill(.white.opacity(0.12))
                    .overlay(Circle().stroke(.white.opacity(0.18), lineWidth: 1))
                Image(systemName: "person.fill")
                    .font(.system(size: 15))
                    .foregroundStyle(.white)
            }
            .frame(width: 34, height: 34)
        }
        .padding(.horizontal, 18)
        .padding(.top, 58)
    }

    // MARK: - Contenu du hero

    private var heroContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("À LA UNE")
                .font(.system(size: 11, weight: .bold))
                .tracking(1)
                .foregroundStyle(Theme.accentLight)
                .padding(.horizontal, 11)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(Theme.accentBlue2.opacity(0.18))
                        .overlay(Capsule().stroke(Theme.accentBlue2.opacity(0.4), lineWidth: 1))
                )

            Text(item.title)
                .font(.system(size: 38, weight: .heavy))
                .foregroundStyle(.white)
                .padding(.top, 12)

            HStack(spacing: 8) {
                Text(item.cat)
                Text("•").opacity(0.5)
                Text(item.year)
                Text("•").opacity(0.5)
                Text(item.duration)
            }
            .font(.system(size: 13, weight: .semibold))
            .foregroundStyle(Theme.textSecondary)
            .padding(.top, 9)

            HStack(spacing: 11) {
                NavigationLink(destination: DetailView(item: item)) {
                    Label("Regarder", systemImage: "play.fill")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Theme.buttonGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Theme.accentBlue.opacity(0.4), radius: 13, x: 0, y: 10)
                }
                .buttonStyle(.plain)

                Button(action: { favorites.toggle(item) }) {
                    HStack(spacing: 7) {
                        Image(systemName: favorites.isFavorite(item) ? "checkmark" : "plus")
                        Text("Ma liste")
                    }
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 18)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white.opacity(0.10))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.20), lineWidth: 1))
                    )
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 18)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 26)
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            HeroBannerView(item: SampleData.featured)
        }
        .background(Theme.background)
    }
    .environmentObject(FavoritesStore())
}
