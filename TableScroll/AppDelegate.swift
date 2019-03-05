import Cocoa

let cellID = NSUserInterfaceItemIdentifier("CellID")
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tableView: NSTableView!

    lazy var data: [Int: Int] = {
        let kv = (0..<100).map { ($0, Int.random(in: 20...50)) }
        return Dictionary(uniqueKeysWithValues: kv)
    }()
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cellView = tableView.makeView(withIdentifier: cellID, owner: self) as? CellView else { assertionFailure(); return nil }
        cellView.textField.stringValue = String(row)
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        guard let intVal = data[row] else { assertionFailure(); return 20 }
        return CGFloat(intVal)
    }
    
    @IBAction func scrollButtonClicked(_ sender: NSButton) {
        tableView.scrollRowToVisible(data.count - 1)
    }
}

