//
//  PostCommand.swift
//  iSstp
//
//  Created by Fabrizio Perria on 17/11/2023.
//  Copyright © 2023 axot. All rights reserved.
//

import Cocoa
import AppKit
import Foundation

class PostCommandsViewController: NSViewController, NSTableViewDelegate {
    var account: Account?
    var superViewController: ViewController?

    @IBOutlet var commandTextView: NSTextView!
    @IBOutlet weak var saveButton: NSButton!
    @IBOutlet weak var cancelButton: NSButton!
    
    override func viewWillAppear() {
        preferredContentSize = self.view.frame.size
        
        if let commands = account?.commands {
            commandTextView.string = commands
        }
    }

    @IBAction func cancePressed(_ sender: NSButton) {
        dismiss(self)
    }
    
    @IBAction func savePressed(_ sender: NSButton) {
        account?.commands = commandTextView.textStorage?.string
        superViewController!.saveConfig(self)
        dismiss(self)
    }
    
    
    
    //    @IBAction func saveBtnPressed(_ sender: AnyObject) {
//        account?.option = optionText.stringValue
//        superViewController!.saveConfig(self)
//        dismiss(self)
//    }
//
//    @IBAction func resetBtnPressed(_ sender: AnyObject) {
//        optionText.stringValue = account!.defaultOption
//    }
}
