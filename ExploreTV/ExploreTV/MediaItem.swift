import Foundation

struct MediaItem: Identifiable {
    let id: UUID
    let title: String
    let imageName: String
    let overview: String
    let category: Category
    var isFavorite: Bool

    init(
        id: UUID = UUID(),
        title: String,
        imageName: String,
        overview: String,
        category: Category,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.title = title
        self.imageName = imageName
        self.overview = overview
        self.category = category
        self.isFavorite = isFavorite
    }
}
