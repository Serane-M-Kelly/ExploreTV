import SwiftUI

struct DetailView: View {
    let item: MediaItem
    @State private var isFavorite: Bool

    init(item: MediaItem) {
        self.item = item
        self._isFavorite = State(initialValue: item.isFavorite)
    }

    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {

                    // MARK: - Hero image
                    ZStack(alignment: .bottomLeading) {
                        ZStack {
                            Color("CardBackground")
                            Image(systemName: item.imageName)
                                .font(.system(size: 80))
                                .foregroundStyle(Color("AccentBlue").opacity(0.7))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 280)

                        LinearGradient(
                            colors: [.clear, Color("AppBackground")],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 280)

                        Text(item.category.rawValue.uppercased())
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("AccentBlue"))
                            .tracking(2)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                    }

                    // MARK: - Content
                    VStack(alignment: .leading, spacing: 20) {

                        // Title
                        Text(item.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)

                        // Action buttons
                        HStack(spacing: 12) {
                            // Regarder — visual only, no real video action
                            Button(action: {}) {
                                Label("Regarder", systemImage: "play.fill")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(Color("AccentBlue"))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .buttonStyle(.plain)

                            // Favorites — local toggle state
                            Button(action: { isFavorite.toggle() }) {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .font(.title2)
                                    .foregroundStyle(isFavorite ? Color("AccentBlue") : .white)
                                    .frame(width: 48, height: 48)
                                    .background(Color("CardBackground"))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .buttonStyle(.plain)
                        }

                        // Synopsis
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Synopsis")
                                .font(.headline)
                                .foregroundStyle(.white)

                            Text(item.overview)
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.8))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color("AppBackground"), for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        DetailView(item: SampleData.featured)
    }
}
