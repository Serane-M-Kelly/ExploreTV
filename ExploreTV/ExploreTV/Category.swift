import Foundation

/// Regroupements du catalogue, alignés sur la maquette ExploreTV.
/// Servent au filtrage (Explorer) et aux libellés (Ma liste).
enum Category: String, CaseIterable {
    case documentaires = "Documentaires"
    case voyagesCultures = "Voyages & Cultures"
    case scienceFutur = "Science & Futur"
    case courtsMetrages = "Courts-métrages"
}
