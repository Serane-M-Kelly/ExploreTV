import SwiftUI

struct HeroBannerView: View {
    let item: MediaItem

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack {
                Color("CardBackground")
                Image(systemName: item.imageName)
                    .font(.system(size: 90))
                    .foregroundStyle(Color("AccentBlue").opacity(0.7))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 340)

            LinearGradient(
                colors: [.clear, Color("AppBackground")],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(maxWidth: .infinity)
            .frame(height: 340)

            VStack(alignment: .leading, spacing: 8) {
                Text(item.category.rawValue.uppercased())
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("AccentBlue"))
                    .tracking(2)

                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Text(item.overview)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.7))
                    .lineLimit(2)

                NavigationLink(destination: DetailView(item: item)) {
                    Label("Regarder", systemImage: "play.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color("AccentBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.top, 4)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    NavigationStack {
        HeroBannerView(item: SampleData.featured)
            .background(Color("AppBackground"))
    }
    .environmentObject(FavoritesStore())
}
