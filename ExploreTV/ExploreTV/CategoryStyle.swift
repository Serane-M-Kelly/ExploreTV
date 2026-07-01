import SwiftUI

// MARK: - Couleur depuis un code hexadécimal

extension Color {
    /// Crée une couleur à partir d'un hex "RRGGBB" ou "#RRGGBB".
    init(hex: String) {
        var s = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if s.hasPrefix("#") { s.removeFirst() }
        var value: UInt64 = 0
        Scanner(string: s).scanHexInt64(&value)
        let r = Double((value & 0xFF0000) >> 16) / 255.0
        let g = Double((value & 0x00FF00) >> 8) / 255.0
        let b = Double(value & 0x0000FF) / 255.0
        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1.0)
    }
}

// MARK: - Palette ExploreTV (maquette réparée)

enum Theme {
    static let background = Color(hex: "070b18")
    static let pageBackground = Color(hex: "05070d")
    static let surface = Color.white.opacity(0.04)
    static let surfaceStroke = Color.white.opacity(0.07)

    static let accentBlue = Color(hex: "2563ff")
    static let accentBlue2 = Color(hex: "3b82f6")
    static let accentPurple = Color(hex: "6d28d9")

    static let textPrimary = Color(hex: "eef2fb")
    static let textStrong = Color(hex: "f4f7ff")
    static let textSecondary = Color(hex: "c4cfe6")
    static let textMuted = Color(hex: "8b97b3")
    static let categoryTint = Color(hex: "9fb0d8")
    static let accentLight = Color(hex: "9fc0ff")
    static let chevronMuted = Color(hex: "566180")
    static let overlayDark = Color(hex: "04060e")
    static let badgeText = Color(hex: "dbe4ff")

    /// Dégradé bleu → violet des boutons "Regarder" et accents.
    static let buttonGradient = LinearGradient(
        colors: [accentBlue, accentPurple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
