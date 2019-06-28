//
//  InterfaceController.swift
//  WatchDemoAryaActivity2 WatchKit Extension
//
//  Created by Arya S  Asok on 2019-06-27.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet weak var messageLabel: WKInterfaceLabel!
    
    @IBOutlet weak var acknowledgeLabel: WKInterfaceLabel!
    var labelSaysHello = true
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func buttonClicked() {
        print("i pushed the button")
        
        if (WCSession.default.isReachable) {
            let message = ["Message" : "Hello"]
            // This is the actual closure definition. The reply(message) sent from the phone is
            // handled here
            WCSession.default.sendMessage(message, replyHandler: { (message) in
                
                self.acknowledgeLabel.setText("\(message["Message"]!)")
                
            }) { (error) in
                print(error)
            }
        }
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
}

    
    

