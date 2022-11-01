import AppKit
import KeyboardShortcuts


class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        KeyboardShortcuts.onKeyDown(for: .toggle, action: {
            TheInput().show()
        })
    } 
    
}
