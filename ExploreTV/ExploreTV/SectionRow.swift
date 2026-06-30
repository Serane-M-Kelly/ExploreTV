import SwiftUI

struct SectionRow: View {
    let category: Category
    let items: [MediaItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(category.rawValue)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            ContentCard(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    SectionRow(category: .action, items: SampleData.items(for: .action))
        .padding(.vertical)
        .background(Color("AppBackground"))
        .environmentObject(FavoritesStore())
}
