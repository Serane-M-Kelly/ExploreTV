import Foundation
import Combine

final class FavoritesStore: ObservableObject {
    @Published var favoriteIDs: Set<UUID>

    private let storageKey = "favoriteIDs"

    init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode(Set<UUID>.self, from: data) {
            favoriteIDs = decoded
        } else {
            favoriteIDs = []
        }
    }

    func toggle(_ item: MediaItem) {
        if favoriteIDs.contains(item.id) {
            favoriteIDs.remove(item.id)
        } else {
            favoriteIDs.insert(item.id)
        }
        save()
    }

    func isFavorite(_ item: MediaItem) -> Bool {
        favoriteIDs.contains(item.id)
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(favoriteIDs) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}
