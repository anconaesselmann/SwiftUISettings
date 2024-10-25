//  Created by Axel Ancona Esselmann on 10/25/24.
//

import SwiftUI
import UserPreferences

@main
struct ExampleApp: App {

    private var colorScheme: ColorScheme?

    var preferences: ExampleUserPreferences

    init() {
        let preferencesStore = UserDefaultsPreferencesStore.shared
        self.preferences = ExampleUserPreferences(preferencesStore)
        colorScheme = preferences[.colorScheme, as: PreferredColorScheme.self]?.colorScheme
    }

    var body: some Scene {
        #if os(macOS)
        WindowGroup {
            ContentViewMacOS()
                .preferredColorScheme(colorScheme)
                .environmentObject(preferences)
        }
        Settings {
            let vm = ExampleSettingsViewModel(preferences: preferences)
            ExampleSettingsView(vm: vm)
                .preferredColorScheme(colorScheme)
                .environmentObject(preferences)
        }
        #else
        WindowGroup {
            ContentViewIOS()
                .preferredColorScheme(colorScheme)
                .environmentObject(preferences)
        }
        #endif
    }
}

