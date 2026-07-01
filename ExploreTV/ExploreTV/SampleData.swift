import Foundation

/// Catalogue fictif repris de la maquette ExploreTV (buildCatalog / homeRows).
/// Tous les contenus et affiches sont fictifs et générés.
struct SampleData {

    static let allMedia: [MediaItem] = [
        MediaItem(
            slug: "ocean-memory", title: "Ocean Memory", cat: "Documentaire",
            category: .documentaires, duration: "52 min", year: "2024",
            gradientStart: "#06283d", gradientEnd: "#1f8fbf",
            tags: ["Nature", "Océan", "4K"],
            summary: "Plongée contemplative dans la mémoire des grands fonds : courants, lumière et silence d'un monde que l'on connaît à peine.",
            motifIndex: 0
        ),
        MediaItem(
            slug: "street-pulse", title: "Street Pulse", cat: "Série documentaire",
            category: .documentaires, duration: "6 × 28 min", year: "2023",
            gradientStart: "#16162e", gradientEnd: "#4361ee",
            tags: ["Urbain", "Société"],
            summary: "Le battement des grandes villes raconté par celles et ceux qui les font vivre la nuit, en six épisodes.",
            motifIndex: 1
        ),
        MediaItem(
            slug: "beyond-mars", title: "Beyond Mars", cat: "Science & Futur",
            category: .scienceFutur, duration: "1 h 12", year: "2025",
            gradientStart: "#1a1240", gradientEnd: "#6d28d9",
            tags: ["Espace", "Science", "Exploration"],
            summary: "Et après Mars ? Une enquête visuelle sur les prochaines frontières de l'exploration spatiale et les esprits qui les imaginent.",
            motifIndex: 2
        ),
        MediaItem(
            slug: "hidden-kyoto", title: "Hidden Kyoto", cat: "Voyage & Culture",
            category: .voyagesCultures, duration: "47 min", year: "2024",
            gradientStart: "#0f2027", gradientEnd: "#3a3897",
            tags: ["Voyage", "Japon", "Culture"],
            summary: "Au-delà des temples célèbres, un Kyoto discret : ateliers d'artisans, jardins secrets et gestes transmis depuis des siècles.",
            motifIndex: 3
        ),
        MediaItem(
            slug: "the-last-forest", title: "The Last Forest", cat: "Nature",
            category: .documentaires, duration: "58 min", year: "2023",
            gradientStart: "#06283d", gradientEnd: "#1f7a8c",
            tags: ["Nature", "Climat"],
            summary: "Au cœur d'une forêt primaire menacée, le portrait d'un écosystème et de celles et ceux qui le protègent.",
            motifIndex: 0
        ),
        MediaItem(
            slug: "voices-of-dakar", title: "Voices of Dakar", cat: "Culture & Musique",
            category: .voyagesCultures, duration: "44 min", year: "2024",
            gradientStart: "#2a1259", gradientEnd: "#7c3aed",
            tags: ["Musique", "Culture"],
            summary: "Une génération d'artistes réinvente le son de Dakar, entre héritage et avenir, du studio à la scène.",
            motifIndex: 1
        ),
        MediaItem(
            slug: "code-of-tomorrow", title: "Code of Tomorrow", cat: "Tech",
            category: .scienceFutur, duration: "39 min", year: "2025",
            gradientStart: "#021024", gradientEnd: "#2563ff",
            tags: ["Tech", "IA", "Futur"],
            summary: "Comment le code façonne le monde de demain : rencontres avec les ingénieures qui dessinent nos outils.",
            motifIndex: 2
        ),
        MediaItem(
            slug: "northern-lights", title: "Northern Lights", cat: "Voyage",
            category: .voyagesCultures, duration: "41 min", year: "2024",
            gradientStart: "#0b1e3b", gradientEnd: "#5b21b6",
            tags: ["Voyage", "Nature"],
            summary: "Cap au nord, à la poursuite des aurores boréales — un carnet de route lumineux sous le ciel polaire.",
            motifIndex: 3
        ),
        MediaItem(
            slug: "inside-motion", title: "Inside Motion", cat: "Sport & Performance",
            category: .courtsMetrages, duration: "26 min", year: "2023",
            gradientStart: "#0a1a3f", gradientEnd: "#3b82f6",
            tags: ["Sport", "Performance"],
            summary: "L'instant suspendu de la performance : ce qui se joue dans le corps et l'esprit juste avant le geste parfait.",
            motifIndex: 0
        ),
        MediaItem(
            slug: "fragments", title: "Fragments", cat: "Court-métrage",
            category: .courtsMetrages, duration: "18 min", year: "2025",
            gradientStart: "#150f33", gradientEnd: "#4338ca",
            tags: ["Fiction", "Indé"],
            summary: "Court-métrage indépendant : trois vies se croisent l'espace d'une nuit dans une ville qui ne dort jamais.",
            motifIndex: 1
        ),
    ]

    private static let bySlug: [String: MediaItem] = Dictionary(
        uniqueKeysWithValues: allMedia.map { ($0.slug, $0) }
    )

    private static func items(slugs: [String]) -> [MediaItem] {
        slugs.compactMap { bySlug[$0] }
    }

    /// Sections horizontales de l'accueil (maquette homeRows).
    static let homeRows: [(title: String, items: [MediaItem])] = [
        ("À la une", items(slugs: ["beyond-mars", "hidden-kyoto", "voices-of-dakar", "code-of-tomorrow"])),
        ("Documentaires", items(slugs: ["ocean-memory", "street-pulse", "the-last-forest"])),
        ("Voyages & Cultures", items(slugs: ["hidden-kyoto", "northern-lights", "voices-of-dakar"])),
        ("Science & Futur", items(slugs: ["beyond-mars", "code-of-tomorrow"])),
        ("Courts-métrages", items(slugs: ["fragments", "inside-motion"])),
    ]

    /// Contenu mis en avant dans le hero (maquette : featured-id="beyond-mars").
    static var featured: MediaItem {
        bySlug["beyond-mars"] ?? allMedia[0]
    }

    static func items(for category: Category) -> [MediaItem] {
        allMedia.filter { $0.category == category }
    }
}
