import SwiftUI


class TheInput: NSPanel, ObservableObject {
    
    @Published var value: String = ""
    override var canBecomeKey: Bool { true }
    
    init() {
        super.init(contentRect: NSRect(), styleMask: [.nonactivatingPanel], backing: .buffered, defer: false)
        
        isFloatingPanel = true
        level = .screenSaver
        isMovableByWindowBackground = true
        backgroundColor = .clear
        
        let theInputView = TheInputView().environmentObject(self)
        contentView = NSHostingView(rootView: theInputView)
        
        delegate = self
    }
        
    func hide() {
        if isVisible {
            orderOut(self)
        }
    }
        
    func show() {
        makeKeyAndOrderFront(self) 
    }

}


extension TheInput: NSWindowDelegate {
    
    func windowDidResignKey(_ notification: Notification) {
        hide()
    }
    
    override func cancelOperation(_ sender: Any?) {
        hide()
    }
        
}
