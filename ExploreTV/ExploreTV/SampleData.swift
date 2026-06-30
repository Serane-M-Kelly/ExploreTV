import Foundation

struct SampleData {
    static let allMedia: [MediaItem] = [
        // Action
        MediaItem(
            title: "Titan Protocol",
            imageName: "flame.fill",
            overview: "Un ancien agent découvre un réseau secret qui menace l'équilibre mondial. Il n'a que 48 heures pour tout faire basculer.",
            category: .action
        ),
        MediaItem(
            title: "Red Signal",
            imageName: "bolt.fill",
            overview: "Trois soldats d'élite sont parachutés dans une zone de guerre interdite. Leur mission : récupérer un signal qui ne devrait pas exister.",
            category: .action
        ),
        MediaItem(
            title: "Operation Zeta",
            imageName: "shield.fill",
            overview: "Quand une IA militaire se retourne contre ses créateurs, une équipe de choc doit la neutraliser avant le point de non-retour.",
            category: .action
        ),

        // Drame
        MediaItem(
            title: "The Last Lighthouse",
            imageName: "light.beacon.max",
            overview: "Un gardien de phare isolé reçoit chaque hiver des lettres d'une inconnue. Jusqu'au jour où elle arrive en personne.",
            category: .drama
        ),
        MediaItem(
            title: "Broken Mirrors",
            imageName: "theatermasks.fill",
            overview: "Deux sœurs se retrouvent après dix ans de silence pour régler la succession de leur père. Mais les secrets familiaux refont surface.",
            category: .drama
        ),
        MediaItem(
            title: "A Distance Called Home",
            imageName: "house.fill",
            overview: "Un immigré revient dans son pays natal pour la première fois depuis vingt ans. Il ne reconnaît plus rien — pas même lui-même.",
            category: .drama
        ),

        // Comédie
        MediaItem(
            title: "Perfect Chaos",
            imageName: "face.smiling.fill",
            overview: "Un chef cuisinier étoilé et une organisatrice de mariages catastrophiques sont forcés de collaborer pour le mariage du siècle.",
            category: .comedy
        ),
        MediaItem(
            title: "The Wrong Wedding",
            imageName: "balloon.fill",
            overview: "Il se trompe de salle de cérémonie. Elle se retrouve mariée à un inconnu. Maintenant ils doivent annuler ça — sans que personne ne le sache.",
            category: .comedy
        ),
        MediaItem(
            title: "Friday Again",
            imageName: "arrow.clockwise",
            overview: "Un homme revit le même vendredi soir en boucle. Il découvre vite que le problème, c'est lui.",
            category: .comedy
        ),

        // Science-fiction
        MediaItem(
            title: "Orion's Edge",
            imageName: "moon.stars.fill",
            overview: "À la frontière du système solaire, un vaisseau reçoit un signal en provenance d'une planète que les cartes indiquent comme inexistante.",
            category: .scifi
        ),
        MediaItem(
            title: "Parallel 9",
            imageName: "infinity",
            overview: "Un physicien ouvre accidentellement un portail vers une version alternative de sa propre vie. Il a sept jours pour choisir laquelle garder.",
            category: .scifi
        ),
        MediaItem(
            title: "The Void Relay",
            imageName: "antenna.radiowaves.left.and.right",
            overview: "Des humains envoient des messages dans le vide. L'un d'eux reçoit une réponse — datée de deux cents ans dans le futur.",
            category: .scifi
        ),
        MediaItem(
            title: "Nova Station",
            imageName: "sparkles",
            overview: "Une station orbitale abrite les derniers survivants d'une Terre irrécupérable. Quand les réserves s'épuisent, les alliances se fracturent.",
            category: .scifi
        ),

        // Thriller
        MediaItem(
            title: "Unseen",
            imageName: "eye.slash.fill",
            overview: "Une femme est convaincue d'être surveillée. Personne ne la croit — jusqu'à ce que les preuves deviennent impossibles à ignorer.",
            category: .thriller
        ),
        MediaItem(
            title: "The Fourth Floor",
            imageName: "lock.fill",
            overview: "Un détective enquête sur des disparitions dans un immeuble haussmannien. Chaque victime habitait le quatrième étage.",
            category: .thriller
        ),

        // Documentaire
        MediaItem(
            title: "Blue Silence",
            imageName: "drop.fill",
            overview: "Plongée dans les profondeurs des océans peu explorés. Des chercheurs découvrent des écosystèmes entiers que la science ignorait.",
            category: .documentary
        ),
        MediaItem(
            title: "Earth 2100",
            imageName: "globe.europe.africa.fill",
            overview: "Des scientifiques, des artistes et des citoyens imaginent la Terre dans soixante-quinze ans. Leurs visions divergent radicalement.",
            category: .documentary
        ),
        MediaItem(
            title: "The Code Makers",
            imageName: "cpu.fill",
            overview: "L'histoire méconnue des femmes qui ont écrit les premiers algorithmes de l'histoire. Un récit de génie et d'invisibilité.",
            category: .documentary
        ),
    ]

    static func items(for category: Category) -> [MediaItem] {
        allMedia.filter { $0.category == category }
    }

    static var featured: MediaItem {
        allMedia[0]
    }
}
