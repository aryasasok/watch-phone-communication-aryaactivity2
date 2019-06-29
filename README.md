# watch-phone-communication-aryaactivity2


Theoretical Questions And Answers



1. On the IOS side, what function is used to receive messages from the watch?

Answers 1,func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {


In program
 func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("Got a message")
        watchMessageLabel.text = "\(message["Message"]!)"
        // This is calling the  closure and here we are sending the acknowledgement message back to the watch
        replyHandler(["Message" : "Acknowledged!"])
    }

2. When receiving messages from the watch, you need to use a closure function. What is the reason why a closure is used?

Answer 2,
The closure is used because the  delivery of messages happen  asynchronously. 
The sendmessage returns immediately, but the actual message delivery to the receiver might happen sometime later. 
At that point, if the receiver wants to send back a reply(acknowledgement in our case), the replyHandler closure is invoked.
At that time original sender watch causes the code inside the replyHandler closure to be executed asynchronously
