//  Created by Axel Ancona Esselmann on 10/25/24.
//

#if !os(macOS)
import SwiftUI

struct ContentViewIOS: View {

    @State
    var settingsPresented = false

    @EnvironmentObject
    var preferences: ExampleUserPreferences

    var body: some View {
        NavigationStack {
            VStack {
                Text("You are on iOS. The settings button is in the nav bar.")
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        settingsPresented = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $settingsPresented) {
                let vm = ExampleSettingsViewModel(preferences: preferences)
                ExampleSettingsView(vm: vm)
            }
        }
    }
}
#endif
