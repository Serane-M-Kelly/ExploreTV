import Foundation
import Combine

final class FavoritesStore: ObservableObject {
    @Published var favoriteIDs: Set<String>

    private let storageKey = "favoriteSlugs"

    init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
            favoriteIDs = decoded
        } else {
            favoriteIDs = []
        }
    }

    func toggle(_ item: MediaItem) {
        if favoriteIDs.contains(item.slug) {
            favoriteIDs.remove(item.slug)
        } else {
            favoriteIDs.insert(item.slug)
        }
        save()
    }

    func isFavorite(_ item: MediaItem) -> Bool {
        favoriteIDs.contains(item.slug)
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(favoriteIDs) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}
