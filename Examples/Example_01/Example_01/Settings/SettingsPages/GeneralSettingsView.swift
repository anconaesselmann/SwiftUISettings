//  Created by Axel Ancona Esselmann on 1/10/24.
//

import SwiftUI
import SwiftUISettings
import UserPreferences

typealias ExampleUserPreferences = UserPreferences<ExamplePreferenceKey>

struct GeneralSettingsView: View {

    @Environment(\.openURL) var openURL

    @EnvironmentObject
    var preferences: ExampleUserPreferences

    @State private var showingAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GroupBox("About") {
                    SettingsLabel(label: "App version:", caption: Global.appVersion ?? "No app version")
                }
                GroupBox("Preferences") {
                    SettingsButton(
                        label: "Settings",
                        caption: "Reset all") {
                            let excluded: [ExamplePreferenceKey] = []
                            preferences.reset(except: excluded)
                            showingAlert = true
                        }
                }
                GroupBox("Support") {
                    SettingsButton(label: "Report a bug", caption: "Issues") {
                        openURL(URLs.support)
                    }
                }
            }
            .padding()
        }
        .alert("Preferences reset", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
