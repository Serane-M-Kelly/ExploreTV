import SwiftUI

/// Section horizontale de l'accueil (maquette homeRows) : titre + carrousel de cartes.
struct SectionRow: View {
    let title: String
    let items: [MediaItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Theme.textPrimary)
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 13) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            ContentCard(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 4)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SectionRow(title: "Documentaires", items: SampleData.items(for: .documentaires))
            .padding(.vertical)
            .background(Theme.background)
    }
    .environmentObject(FavoritesStore())
}
