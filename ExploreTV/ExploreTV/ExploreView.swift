import SwiftUI

/// Écran Explorer (maquette ExploreTV) : recherche, filtres, grille 2 colonnes.
struct ExploreView: View {
    @State private var searchQuery: String = ""
    @State private var selectedCategory: Category? = nil

    private let columns = [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)]

    private var filteredItems: [MediaItem] {
        SampleData.allMedia
            .filter { selectedCategory == nil || $0.category == selectedCategory }
            .filter {
                searchQuery.isEmpty
                    || $0.title.lowercased().contains(searchQuery.lowercased())
                    || $0.cat.lowercased().contains(searchQuery.lowercased())
                    || $0.category.rawValue.lowercased().contains(searchQuery.lowercased())
            }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Explorer")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.top, 8)

                        searchField
                            .padding(.horizontal, 20)
                            .padding(.top, 16)

                        chips
                            .padding(.top, 14)

                        LazyVGrid(columns: columns, spacing: 14) {
                            ForEach(filteredItems) { item in
                                NavigationLink(destination: DetailView(item: item)) {
                                    ContentCard(item: item, height: 172, fillWidth: true)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 24)
                    }
                }
            }
            .navigationTitle("Explorer")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Theme.textMuted)
            TextField("", text: $searchQuery, prompt: Text("Rechercher un titre, une catégorie…")
                .foregroundColor(Theme.textMuted))
                .foregroundStyle(Theme.textPrimary)
                .tint(Theme.accentBlue)
        }
        .padding(.horizontal, 14)
        .frame(height: 46)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.white.opacity(0.07))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.10), lineWidth: 1))
        )
    }

    private var chips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 9) {
                chip(title: "Tout", isSelected: selectedCategory == nil) {
                    selectedCategory = nil
                }
                ForEach(Category.allCases, id: \.self) { category in
                    chip(title: category.rawValue, isSelected: selectedCategory == category) {
                        selectedCategory = (selectedCategory == category) ? nil : category
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 2)
        }
    }

    private func chip(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(isSelected ? .white : Theme.textSecondary)
                .padding(.horizontal, 15)
                .padding(.vertical, 9)
                .background(
                    Capsule()
                        .fill(isSelected ? AnyShapeStyle(Theme.buttonGradient) : AnyShapeStyle(Color.white.opacity(0.06)))
                        .overlay(
                            Capsule().stroke(isSelected ? Color.clear : Color.white.opacity(0.10), lineWidth: 1)
                        )
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ExploreView()
        .environmentObject(FavoritesStore())
}
