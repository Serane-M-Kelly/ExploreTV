import SwiftUI

/// Écran Profil (maquette ExploreTV) : compte, statistiques, réglages.
struct ProfileView: View {
    @EnvironmentObject var favorites: FavoritesStore

    private let settingsItems: [(icon: String, label: String)] = [
        ("arrow.down.circle", "Téléchargements"),
        ("clock", "Historique de lecture"),
        ("sparkles", "Qualité de lecture"),
        ("bell", "Notifications"),
        ("questionmark.circle", "Aide & support"),
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        Text("Profil")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundStyle(.white)
                            .padding(.top, 8)

                        userCard
                        stats
                        settingsList
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    // MARK: - Carte utilisateur

    private var userCard: some View {
        HStack(spacing: 15) {
            ZStack {
                Circle().fill(Theme.buttonGradient)
                Text("L")
                    .font(.system(size: 24, weight: .heavy))
                    .foregroundStyle(.white)
            }
            .frame(width: 62, height: 62)

            VStack(alignment: .leading, spacing: 3) {
                Text("Léa Martin")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundStyle(.white)
                Text("lea.martin@exploretv.app")
                    .font(.system(size: 13))
                    .foregroundStyle(Theme.categoryTint)
                Text("Abonnement Premium")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(Theme.accentLight)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .background(Capsule().fill(Theme.accentBlue2.opacity(0.2)))
                    .padding(.top, 4)
            }
            Spacer(minLength: 0)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Theme.accentBlue.opacity(0.16), Theme.accentPurple.opacity(0.16)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.10), lineWidth: 1))
        )
    }

    // MARK: - Statistiques

    private var stats: some View {
        HStack(spacing: 11) {
            statCard(value: "\(favorites.favoriteIDs.count)", label: "Dans ma liste")
            statCard(value: "37 h", label: "Cette semaine")
        }
    }

    private func statCard(value: String, label: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(value)
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(.white)
            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(Theme.textMuted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.07), lineWidth: 1))
        )
    }

    // MARK: - Réglages

    private var settingsList: some View {
        VStack(spacing: 0) {
            ForEach(Array(settingsItems.enumerated()), id: \.offset) { index, setting in
                HStack(spacing: 13) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 11)
                            .fill(Theme.accentBlue2.opacity(0.14))
                        Image(systemName: setting.icon)
                            .font(.system(size: 15))
                            .foregroundStyle(Theme.accentLight)
                    }
                    .frame(width: 34, height: 34)

                    Text(setting.label)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(Theme.textPrimary)

                    Spacer(minLength: 0)

                    Image(systemName: "chevron.right")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(Theme.chevronMuted)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 15)

                if index < settingsItems.count - 1 {
                    Divider()
                        .overlay(.white.opacity(0.05))
                        .padding(.leading, 62)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(.white.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.07), lineWidth: 1))
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    ProfileView()
        .environmentObject(FavoritesStore())
}
