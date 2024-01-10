//  Created by Axel Ancona Esselmann on 1/10/24.
//

import SwiftUI
import UserPreferences

public protocol SettingsPath: CaseIterable, PreferenceValue
    where AllCases.Index == Int
{
    var title: String { get }
    var systemImageName: String { get }
    var iconColor: Color { get }
}
