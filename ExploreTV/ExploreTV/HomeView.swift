import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground").ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 28) {
                        HeroBannerView(item: SampleData.featured)

                        ForEach(Category.allCases, id: \.self) { category in
                            let items = SampleData.items(for: category)
                            if !items.isEmpty {
                                SectionRow(category: category, items: items)
                            }
                        }
                    }
                    .padding(.bottom, 24)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    HomeView()
}
