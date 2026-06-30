import SwiftUI

struct ContentCard: View {
    let item: MediaItem

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("CardBackground"))
                Image(systemName: item.imageName)
                    .font(.system(size: 36))
                    .foregroundStyle(Color("AccentBlue"))
            }
            .frame(width: 120, height: 168)

            Text(item.title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .lineLimit(2)
                .frame(width: 120, alignment: .leading)
        }
    }
}

#Preview {
    ContentCard(item: SampleData.allMedia[0])
        .padding()
        .background(Color("AppBackground"))
}
