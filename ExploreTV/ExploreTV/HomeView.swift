import SwiftUI

/// Écran d'accueil (maquette ExploreTV) : hero + sections horizontales.
struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        HeroBannerView(item: SampleData.featured)

                        ForEach(Array(SampleData.homeRows.enumerated()), id: \.offset) { _, row in
                            SectionRow(title: row.title, items: row.items)
                        }
                    }
                    .padding(.bottom, 24)
                }
                .ignoresSafeArea(.container, edges: .top)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoritesStore())
}
