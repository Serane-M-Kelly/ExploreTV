import SwiftUI

/// Fiche détail (maquette ExploreTV) : grand visuel, méta, boutons,
/// tags, résumé et suggestions similaires.
struct DetailView: View {
    let item: MediaItem
    @EnvironmentObject var favorites: FavoritesStore
    @Environment(\.dismiss) private var dismiss
    @State private var showPlaybackNotice = false

    private var suggestions: [MediaItem] {
        let sameGroup = SampleData.items(for: item.category).filter { $0.id != item.id }
        if sameGroup.isEmpty {
            return Array(SampleData.allMedia.filter { $0.id != item.id }.prefix(6))
        }
        return Array(sameGroup.prefix(6))
    }

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    hero
                    content
                }
            }
            .ignoresSafeArea(.container, edges: .top)
        }
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Grand visuel

    private var hero: some View {
        PosterArtworkView(item: item)
            .frame(height: 430)
            .overlay(alignment: .bottom) {
                LinearGradient(
                    colors: [.clear, Theme.background.opacity(0.65), Theme.background],
                    startPoint: .top, endPoint: .bottom
                )
                .frame(height: 260)
            }
            .overlay(alignment: .topLeading) { backButton }
            .overlay(alignment: .bottomLeading) { heroCaption }
            .clipped()
    }

    private var backButton: some View {
        Button(action: { dismiss() }) {
            Image(systemName: "chevron.left")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 38, height: 38)
                .background(
                    Circle()
                        .fill(Color(red: 4 / 255, green: 6 / 255, blue: 14 / 255).opacity(0.5))
                        .overlay(Circle().stroke(.white.opacity(0.18), lineWidth: 1))
                )
        }
        .buttonStyle(.plain)
        .padding(.leading, 18)
        .padding(.top, 58)
    }

    private var heroCaption: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.title)
                .font(.system(size: 34, weight: .heavy))
                .foregroundStyle(.white)
            HStack(spacing: 8) {
                Text(item.cat).foregroundStyle(Theme.accentLight).fontWeight(.bold)
                Text("•").opacity(0.5)
                Text(item.year)
                Text("•").opacity(0.5)
                Text(item.duration)
            }
            .font(.system(size: 13, weight: .semibold))
            .foregroundStyle(Theme.textSecondary)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 22)
    }

    // MARK: - Contenu

    private var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            actionButtons

            // Tags
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(item.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(Theme.textSecondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 5)
                            .background(
                                Capsule()
                                    .fill(.white.opacity(0.06))
                                    .overlay(Capsule().stroke(.white.opacity(0.10), lineWidth: 1))
                            )
                    }
                }
            }
            .padding(.top, 20)

            Text(item.summary)
                .font(.system(size: 14.5))
                .foregroundStyle(Theme.textSecondary)
                .lineSpacing(5)
                .padding(.top, 18)

            if !suggestions.isEmpty {
                Text("Suggestions similaires")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Theme.textPrimary)
                    .padding(.top, 28)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 13) {
                        ForEach(suggestions) { suggestion in
                            NavigationLink(destination: DetailView(item: suggestion)) {
                                ContentCard(item: suggestion, width: 124, height: 176)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.bottom, 4)
                }
                .padding(.top, 13)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 4)
        .padding(.bottom, 48)
    }

    private var actionButtons: some View {
        HStack(spacing: 11) {
            Button(action: { showPlaybackNotice = true }) {
                Label("Regarder", systemImage: "play.fill")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Theme.buttonGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Theme.accentBlue.opacity(0.38), radius: 13, x: 0, y: 10)
            }
            .buttonStyle(.plain)
            .alert("Lecture indisponible", isPresented: $showPlaybackNotice) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("La lecture vidéo n'est pas disponible dans cette démo ExploreTV.")
            }

            Button(action: { favorites.toggle(item) }) {
                let saved = favorites.isFavorite(item)
                HStack(spacing: 7) {
                    Image(systemName: saved ? "checkmark" : "plus")
                    Text(saved ? "Ajouté" : "Ma liste")
                }
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(saved ? Theme.accentLight : .white)
                .padding(.horizontal, 18)
                .frame(height: 52)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white.opacity(0.10))
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.20), lineWidth: 1))
                )
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(item: SampleData.featured)
            .environmentObject(FavoritesStore())
    }
}
