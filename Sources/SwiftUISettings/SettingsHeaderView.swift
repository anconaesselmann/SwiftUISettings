//  Created by Axel Ancona Esselmann on 1/10/24.
//

import SwiftUI

struct SettingsHeaderView<Path>: View
    where Path: SettingsPath,
          Path: Hashable
{
    @Binding
    var navStack: [Path]

    var selection: Path {
        navStack.last ?? Path.allCases[0]
    }

    @State
    var poppedStack: [Path] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 16) {
                Button(action: {
                    guard let popped = navStack.popLast() else {
                        return
                    }
                    poppedStack.append(popped)
                }, label: {
                    Image(systemName: "chevron.left")
                }).disabled(navStack.count <= 1 )

                Button(action: {
                    guard let popped = poppedStack.popLast() else {
                        return
                    }
                    navStack.append(popped)
                }, label: {
                    Image(systemName: "chevron.right")
                }).disabled(poppedStack.isEmpty )

                Text(selection.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .bold()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(.secondary)
            Divider()
                .overlay(.black.opacity(0.5))
        }
    }
}
