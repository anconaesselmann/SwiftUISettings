//  Created by Axel Ancona Esselmann on 10/14/23.
//

import SwiftUI

struct Colors {
    enum Text: String {
        case `default` = "text.default"
        case secondary = "text.secondary"
        case tertiary = "text.tertiary"
        case selected = "text.selected"
    }
    enum Background: String {
        case highlight = "background.highlight"
        case primary = "background.primary"
        case secondary = "background.secondary"
    }

    enum Border: String {
        case highlight = "border.highlight"
    }
}

extension View {
    func foregroundColor(_ color: Colors.Text) -> some View {
        foregroundColor(Color(color.rawValue))
    }

    func background(_ color: Colors.Background) -> some View {
        return background(Color(color.rawValue))
    }
}

#if os(macOS)
import AppKit

extension Color {
    struct Border {
        static var highlight = Color(NSColor(named: Colors.Border.highlight.rawValue, bundle: Bundle.module)!)
    }
    struct Text {
        static var `default` = Color(NSColor(named: Colors.Text.default.rawValue, bundle: Bundle.module)!)
        static var secondary = Color(NSColor(named: Colors.Text.secondary.rawValue, bundle: Bundle.module)!)
        static var tertiary = Color(NSColor(named: Colors.Text.tertiary.rawValue, bundle: Bundle.module)!)
    }
    struct Background {
        static var highlight = Color(NSColor(named: Colors.Background.highlight.rawValue, bundle: Bundle.module)!)
        static var secondary = Color(NSColor(named: Colors.Background.secondary.rawValue, bundle: Bundle.module)!)
    }
}

#else
import UIKit

extension Color {
    struct Border {
        static var highlight = Color(UIColor(named: Colors.Border.highlight.rawValue, in: .module, compatibleWith: nil)!)
    }
    struct Text {
        static var `default` = Color(UIColor(named: Colors.Text.default.rawValue, in: .module, compatibleWith: nil)!)
        static var secondary = Color(UIColor(named: Colors.Text.secondary.rawValue, in: .module, compatibleWith: nil)!)
        static var tertiary = Color(UIColor(named: Colors.Text.tertiary.rawValue, in: .module, compatibleWith: nil)!)
    }
    struct Background {
        static var highlight = Color(UIColor(named: Colors.Background.highlight.rawValue, in: .module, compatibleWith: nil)!)
        static var secondary = Color(UIColor(named: Colors.Background.secondary.rawValue, in: .module, compatibleWith: nil)!)
    }
}
#endif
