//  Created by Axel Ancona Esselmann on 10/25/24.
//

import SwiftUI
import UserPreferences

public protocol ButtonPickerOption: PreferenceValue, CaseIterable, Identifiable {
    var description: String { get }
}

public struct ButtonPicker<Option>: View
    where Option: ButtonPickerOption, Option.AllCases: RandomAccessCollection
{

    private let title: String

    private let callback: (Option) -> Void

    @State
    private var selected: Option

    public init(
        title: String,
        defaultValue: Option,
        callback: @escaping (Option) -> Void
    ) {
        self.title = title
        self.callback = callback
        self.selected = defaultValue
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                #if os(macOS)
                .padding(.horizontal, 8)
                #endif
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Spacer()
                ForEach(Option.allCases) { option in
                    Button(option.description) {
                        self.selected = option
                        callback(option)
                    }
                    .disabled(self.selected == option)
                }
                Spacer()
            }
        }
        #if os(macOS)
        .padding(.vertical, 16)
        #else
        .padding(.vertical, 8)
        #endif
    }
}
