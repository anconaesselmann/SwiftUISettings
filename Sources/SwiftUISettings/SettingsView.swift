//  Created by Axel Ancona Esselmann on 1/10/24.
//

import SwiftUI
import UserPreferences

public protocol SettingsView: View {
    associatedtype Selection: View
    associatedtype VM: SettingsViewModel
        where VM.Path == Path
    associatedtype Path: SettingsPath

    var vm: VM { get }

    @ViewBuilder
    func selection(_ selection: Path) -> Selection

    #if os(iOS)
    var dismiss: DismissAction { get }
    #endif
}

#if os(macOS)
public extension SettingsView {

    @MainActor
    @ViewBuilder
    var body: some View {
        HSplitView {
            VStack {
                List(selection: Binding(
                    get: { vm.selection },
                    set: { vm.selection = $0 }
                )) {
                    ForEach(vm.availableSettings, id: \.self) { setting in
                        HStack {
                            SettingsIcon(systemImageName: setting.systemImageName, iconColor: setting.iconColor)
                            Text(setting.title)
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .background(.secondary)
            .frame(width: 216)
            VStack(spacing: 0) {
                SettingsHeaderView<VM.Path>(navStack: Binding(
                    get: { vm.navStack },
                    set: { vm.navStack = $0}
                ))
                selection(vm.selection)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.primary)
            .frame(width: 500)
        }
    }
}
#else
public extension SettingsView {

    @MainActor
    @ViewBuilder
    var body: some View {
        NavigationSplitView {
            List(selection: Binding(
                get: { vm.selection },
                set: { vm.selection = $0 }
            )) {
                ForEach(vm.availableSettings, id: \.self) { setting in
                    HStack {
                        SettingsIcon(systemImageName: setting.systemImageName, iconColor: setting.iconColor)
                        Text(setting.title)
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .toolbar {
                SettingsToolbar {
                    dismiss()
                }
            }
            .navigationBarTitle("Settings", displayMode: .large)
        } detail: {
            VStack(spacing: 0) {
                if let selection = vm.selection {
                    self.selection(selection)
                        .navigationTitle(vm.selection?.title ?? "")
                }
            }
            .background(.primary)
        }
    }
}

struct SettingsToolbar: ToolbarContent {

    let onClose: () -> Void

    @MainActor
    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            HStack {
                Button {
                    onClose()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.default)
                }
            }
        }
    }
}
#endif
