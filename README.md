# ExploreTV

Application iOS SwiftUI de streaming **fictif**. Tous les contenus et affiches sont fictifs et générés : aucune marque, œuvre ou logo réel n'est utilisé.

## Fonctionnalités

- **Accueil** : bannière hero et sections horizontales de contenus.
- **Explorer** : barre de recherche, filtres et grille de résultats sur 2 colonnes.
- **Fiche Détail** : grand visuel, tags, résumé et suggestions associées.
- **Ma liste** : favoris ajoutés/retirés par l'utilisateur, persistés via UserDefaults.
- **Profil** : écran de profil.

Navigation par TabBar à 4 onglets.

## Stack

- Swift et SwiftUI.
- `TabView` + `NavigationStack` pour la navigation.
- Données locales statiques (`MediaItem` / `SampleData`).
- Persistance des favoris via UserDefaults.
- Cible iOS 17.
- Aucun backend, aucune dépendance externe.

## Lancer le projet

1. Ouvrir `ExploreTV/ExploreTV.xcodeproj` dans Xcode.
2. Sélectionner un simulateur iPhone (iOS 17).
3. Lancer avec `Cmd + R`.

## Architecture

Modèles et données :

- `MediaItem`, `Category`, `SampleData`

Navigation :

- `ContentView` (TabBar)

Écrans :

- `HomeView`, `ExploreView`, `DetailView`, `MyListView`, `ProfileView`

Composants réutilisables :

- `PosterArtworkView`, `ContentCard`, `SectionRow`, `HeroBannerView`

Thème et données transverses :

- `CategoryStyle` (thème / palette)
- `FavoritesStore` (favoris)

## Note

La maquette HTML de référence se trouve dans `prototype/` côté espace de travail ; elle n'est pas incluse dans le rendu.
