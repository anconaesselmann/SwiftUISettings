//  Created by Axel Ancona Esselmann on 10/25/24.
//

import SwiftUI
import SwiftUISettings
import UserPreferences

struct AppearanceSettingsView: View {

    @MainActor
    @UserPreference(ExamplePreferenceKey.colorScheme)
    private var colorScheme: PreferredColorScheme = .auto

    @State private var showingAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GroupBox("Appearance") {
                    ButtonPicker(
                        title: "Appearance",
                        defaultValue: colorScheme
                    ) { selected in
                        colorScheme = selected
                        showingAlert = true
                    }
                }
            }
            .padding()
        }
        .alert("Preference changed", isPresented: $showingAlert) {
            Button("Close app", role: .cancel) {
                exit(0)
            }
        }
    }
}

enum PreferredColorScheme: Codable, Equatable, CaseIterable {
    case light, dark, auto

    var colorScheme: ColorScheme? {
        switch self {
        case .auto: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}

extension PreferredColorScheme: ButtonPickerOption {
    var id: Self { self }
    var description: String {
        switch self {
        case .light: return "Light"
        case .dark: return "Dark"
        case .auto: return "System"
        }
    }
}
