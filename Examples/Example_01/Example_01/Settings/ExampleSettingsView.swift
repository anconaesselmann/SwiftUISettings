//  Created by Axel Ancona Esselmann on 10/25/24.
//

import SwiftUI
import SwiftUISettings

struct ExampleSettingsView: SettingsView {

    #if os(iOS)
    @Environment(\.dismiss) var dismiss
    #endif

    @StateObject
    var vm: ExampleSettingsViewModel

    @ViewBuilder
    func selection(_ selection: ExampleSettingsPath) -> some View {
        switch selection {
        case .general:
            GeneralSettingsView()
        case .appearance:
            AppearanceSettingsView()
        }
    }
}

@MainActor
class ExampleSettingsViewModel: SettingsViewModel {

    let preferences: ExampleUserPreferences

    #if os(iOS)
    @Published
    var selection: ExampleSettingsPath?
    #endif

    static let settingsPathKey = ExamplePreferenceKey.settingsPath

    var navStack: [ExampleSettingsPath] = [] {
        didSet { saveNavStack() }
    }

    var availableSettings = ExampleSettingsPath.allCases

    init(preferences: ExampleUserPreferences) {
        self.preferences = preferences
        restoreNavStack()
    }
}
