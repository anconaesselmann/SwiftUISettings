//  Created by Axel Ancona Esselmann on 10/25/24.
//

import Foundation

struct URLs {
    static let support = URL(string: "https://github.com/anconaesselmann/SwiftUISettings/issues")!
}

struct Global {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
