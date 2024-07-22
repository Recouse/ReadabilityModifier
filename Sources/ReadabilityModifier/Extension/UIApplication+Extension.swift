import UIKit

public extension UIApplication
{
    ///
    /// Returns `true` when if the app is running on an iPad in splitscreen mode
    ///
    var isSplitOrSlideOver: Bool
    {
        guard let window = windows
            .filter(\.isKeyWindow)
            .first
        else { return false }
        #if os(visionOS)
        let screenBounds = CGRect(x: 0, y: 0, width: 1024, height: 768)
        #else
        let screenBounds = window.screen.bounds
        #endif
        return !(window.frame.width == screenBounds.width)
    }

    ///
    /// Returns the safeAreaInsets of the currently displayed window
    ///
    var safeAreaInsets: UIEdgeInsets
    {
        UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
    }
}
