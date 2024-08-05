//  Created by Axel Ancona Esselmann on 1/10/24.
//

import SwiftUI

public protocol SettingsPath: CaseIterable, Codable, Equatable
    where AllCases.Index == Int
{
    var title: String { get }
    var systemImageName: String { get }
    var iconColor: Color { get }
}
