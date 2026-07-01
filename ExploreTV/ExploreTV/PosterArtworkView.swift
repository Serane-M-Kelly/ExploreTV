import SwiftUI

/// Affiche abstraite réutilisable (maquette ExploreTV).
/// Rend un dégradé propre à l'item, une forme décorative, un reflet en haut,
/// et — en contexte carte — un voile sombre en bas avec durée / titre / catégorie.
struct PosterArtworkView: View {
    let item: MediaItem
    /// Ajoute le chrome des cartes (badge durée, dégradé bas, titre, catégorie).
    var showsCardOverlay: Bool = false

    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height

            ZStack {
                // 1. Dégradé principal (≈155°) propre à l'item.
                LinearGradient(
                    colors: [Color(hex: item.gradientStart), Color(hex: item.gradientEnd)],
                    startPoint: UnitPoint(x: 0.12, y: 0.0),
                    endPoint: UnitPoint(x: 0.88, y: 1.0)
                )

                // 2. Forme décorative (variante selon l'item).
                motif(w: w, h: h)

                // 3. Reflet doux en haut.
                RadialGradient(
                    colors: [Color.white.opacity(0.12), .clear],
                    center: UnitPoint(x: 0.5, y: 0.04),
                    startRadius: 0,
                    endRadius: max(w, h) * 0.85
                )

                // 4. Chrome de carte optionnel.
                if showsCardOverlay {
                    cardOverlay(w: w, h: h)
                }
            }
            .frame(width: w, height: h)
        }
    }

    // MARK: - Motif décoratif

    @ViewBuilder
    private func motif(w: CGFloat, h: CGFloat) -> some View {
        let blur = w * 0.16
        switch item.motifIndex % 4 {
        case 0:
            Circle()
                .fill(Color.white.opacity(0.18))
                .frame(width: w * 1.23, height: w * 1.23)
                .position(x: w * 0.72, y: h * 0.25)
                .blur(radius: blur)
        case 1:
            Circle()
                .fill(Color(red: 120 / 255, green: 165 / 255, blue: 1.0).opacity(0.26))
                .frame(width: w * 1.38, height: w * 1.38)
                .position(x: w * 0.29, y: h * 0.75)
                .blur(radius: blur)
        case 2:
            Circle()
                .fill(Color(red: 180 / 255, green: 140 / 255, blue: 1.0).opacity(0.24))
                .frame(width: w * 1.08, height: w * 1.08)
                .position(x: w * 0.58, y: h * 0.28)
                .blur(radius: blur)
        default:
            Ellipse()
                .fill(Color(red: 90 / 255, green: 205 / 255, blue: 1.0).opacity(0.20))
                .frame(width: w * 1.6, height: h * 0.7)
                .position(x: w * 0.5, y: h * 0.62)
                .blur(radius: blur)
        }
    }

    // MARK: - Chrome de carte

    @ViewBuilder
    private func cardOverlay(w: CGFloat, h: CGFloat) -> some View {
        // Voile sombre en bas pour la lisibilité.
        LinearGradient(
            colors: [.clear, Theme.overlayDark.opacity(0.94)],
            startPoint: .center,
            endPoint: .bottom
        )

        // Badge durée en haut à gauche.
        VStack {
            HStack {
                Text(item.duration)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(Theme.badgeText)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(
                        Capsule()
                            .fill(Theme.overlayDark.opacity(0.5))
                            .overlay(Capsule().stroke(.white.opacity(0.14), lineWidth: 1))
                    )
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
        }
        .padding(9)

        // Titre + catégorie en bas.
        VStack(alignment: .leading, spacing: 3) {
            Spacer(minLength: 0)
            Text(item.title)
                .font(.system(size: 13.5, weight: .bold))
                .foregroundStyle(Theme.textStrong)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            Text(item.cat.uppercased())
                .font(.system(size: 9.5, weight: .bold))
                .tracking(0.5)
                .foregroundStyle(Theme.categoryTint)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 11)
        .padding(.bottom, 11)
    }
}

#Preview {
    HStack(spacing: 14) {
        PosterArtworkView(item: SampleData.allMedia[2], showsCardOverlay: true)
            .frame(width: 130, height: 184)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        PosterArtworkView(item: SampleData.allMedia[3], showsCardOverlay: true)
            .frame(width: 130, height: 184)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    .padding()
    .background(Theme.background)
}
