//  Created by Axel Ancona Esselmann on 10/25/24.
//

import SwiftUI
import SwiftUISettings

enum ExampleSettingsPath: String, SettingsPath {
    case general
    case appearance

    var title: String {
        switch self {
        case .general:
            return "General"
        case .appearance:
            return "Appearance"
        }
    }

    var systemImageName: String {
        switch self {
        case .general:
            return "gear"
        case .appearance:
            return "circle.lefthalf.filled"
        }
    }

    var iconColor: Color {
        switch self {
        case .general:
            return .gray
        case .appearance:
            return .black
        }
    }
}
