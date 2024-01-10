//  Created by Axel Ancona Esselmann on 11/20/23.
//

import SwiftUI

struct SettingsIcon: View {

    let systemImageName: String
    let iconColor: Color

    var body: some View {
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .padding(3)
                    .foregroundColor(.white)
            )
            .clipShape(Rectangle())
            .frame(width: 25)
            .cornerRadius(5)
            .foregroundColor(iconColor)
    }
}
