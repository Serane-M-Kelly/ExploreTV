import SwiftUI

/// Carte d'affiche abstraite (maquette ExploreTV).
/// - `fillWidth` : occupe toute la largeur disponible (grille Explorer).
/// - sinon largeur/hauteur fixes (sections horizontales, suggestions).
struct ContentCard: View {
    let item: MediaItem
    var width: CGFloat = 130
    var height: CGFloat = 184
    var fillWidth: Bool = false

    var body: some View {
        PosterArtworkView(item: item, showsCardOverlay: true)
            .frame(maxWidth: fillWidth ? .infinity : nil)
            .frame(width: fillWidth ? nil : width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.white.opacity(0.07), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.4), radius: 11, x: 0, y: 8)
    }
}

#Preview {
    ContentCard(item: SampleData.featured)
        .padding()
        .background(Theme.background)
}
