//  Created by Axel Ancona Esselmann on 10/25/24.
//

import SwiftUI

public struct SettingsButton: View {

    private let label: String
    private let caption: String
    private let onTap: () -> Void

    public init(label: String, caption: String, onTap: @escaping () -> Void) {
        self.label = label
        self.caption = caption
        self.onTap = onTap
    }

    public var body: some View {
        LabeledContent(label) {
            Button(caption) {
                onTap()
            }
        }
        #if os(macOS)
        .padding(.horizontal, 8)
        #endif
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
