//  Created by Axel Ancona Esselmann on 1/10/24.
//

import Foundation
import UserPreferences
import Combine

@MainActor
public protocol SettingsViewModel: ObservableObject 
    where Self.ObjectWillChangePublisher == ObservableObjectPublisher
{
    associatedtype Path
        where Path: SettingsPath,
              Path: Hashable
    associatedtype StorageKey
        where StorageKey: PreferenceKey


    var navStack: [Path] { get set }
    var availableSettings: [Path] { get }
    var preferences: UserPreferences<StorageKey> { get }

    static var settingsPathKey: StorageKey { get }
}

public extension SettingsViewModel {

    func restoreNavStack() {
        navStack = [preferences[Self.settingsPathKey, default: Path.allCases.first!]]
    }

    func saveNavStack() {
        guard preferences[Self.settingsPathKey] != navStack.last else {
            return
        }
        preferences[Self.settingsPathKey] = navStack.last
        self.objectWillChange.send()
    }

    var selection: Path {
        get {
            navStack.last ?? Path.allCases[0]
        }
        set {
            navStack.append(newValue)
        }
    }
}
