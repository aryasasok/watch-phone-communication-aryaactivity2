//
//  ViewController.swift
//  WatchDemoAryaActivity2
//
//  Created by Arya S  Asok on 2019-06-27.
//  Copyright © 2019 Parrot. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    @IBOutlet weak var watchMessageLabel: UILabel!
    var session: WCSession?
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("Got a message")
        watchMessageLabel.text = "\(message["Message"]!)"
        // This is calling the  closure and here we are sending the acknowledgement message back to the watch
        replyHandler(["Message" : "Acknowledged!"])
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if WCSession.isSupported() {
            print("PHONE: Phone supports Watch Connectivity!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        } else {
            print("PHONE: Phone does not support watch connectivity")
        }
    }
}

