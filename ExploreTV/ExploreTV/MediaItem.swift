import Foundation

/// Modèle d'un contenu du catalogue, aligné sur la maquette ExploreTV.
struct MediaItem: Identifiable {
    let id: UUID
    /// Identifiant lisible issu de la maquette (ex. "beyond-mars").
    let slug: String
    let title: String
    /// Sous-titre affiché (ex. "Documentaire", "Science & Futur").
    let cat: String
    /// Regroupement pour le filtrage et Ma liste.
    let category: Category
    let duration: String
    let year: String
    /// Couleurs de l'affiche abstraite (hex), reprises de la maquette.
    let gradientStart: String
    let gradientEnd: String
    let tags: [String]
    let summary: String
    /// Variante de motif décoratif (0…3), pour l'affiche abstraite.
    let motifIndex: Int
    /// Symbole SF de repli (utilisé par certaines vues).
    let imageName: String
    var isFavorite: Bool

    /// Compatibilité : ancien nom de champ.
    var overview: String { summary }
    /// Nom du regroupement (comme dans la maquette).
    var group: String { category.rawValue }

    init(
        id: UUID = UUID(),
        slug: String,
        title: String,
        cat: String,
        category: Category,
        duration: String,
        year: String,
        gradientStart: String,
        gradientEnd: String,
        tags: [String],
        summary: String,
        motifIndex: Int,
        imageName: String,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.slug = slug
        self.title = title
        self.cat = cat
        self.category = category
        self.duration = duration
        self.year = year
        self.gradientStart = gradientStart
        self.gradientEnd = gradientEnd
        self.tags = tags
        self.summary = summary
        self.motifIndex = motifIndex
        self.imageName = imageName
        self.isFavorite = isFavorite
    }
}
