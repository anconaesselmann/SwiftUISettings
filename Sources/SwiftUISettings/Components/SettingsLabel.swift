//  Created by Axel Ancona Esselmann on 10/25/24.
//

import SwiftUI

public struct SettingsLabel: View {

    private let label: String
    private let caption: String

    public init(label: String, caption: String) {
        self.label = label
        self.caption = caption
    }

    public var body: some View {
        LabeledContent(label) {
            Text(caption)
        }
        #if os(macOS)
        .padding(.horizontal, 8)
        #endif
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
