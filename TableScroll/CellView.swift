import AppKit

class CellView: NSView {
    @IBOutlet weak var textField: NSTextField!
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        wantsLayer = true
        layer?.backgroundColor = #colorLiteral(red: 0.9820943475, green: 1, blue: 0.7579526901, alpha: 1)
    }
}
