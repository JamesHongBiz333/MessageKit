/*
 MIT License
 
 Copyright (c) 2017 MessageKit
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit
import MessageKit

class ConversationViewController: MessagesViewController, MessagesDataSource {
    
    var currentSender: Sender = Sender(id: "123", displayName: "Steven")
    
    var messages: [MessageType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSampleData()
        messagesCollectionView.messagesDataSource = self
        // Do any additional setup after loading the view.
    }
    
    func addSampleData() {
        
        let sender1 = Sender(id: "123456", displayName: "Bobby")
        let sender2 = Sender(id: "654321", displayName: "Steven")
        let sender3 = Sender(id: "777999", displayName: "Omar")
        
        let msg1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit." +
                   "Pellentesque venenatis, ante et hendrerit rutrum" +
                   "Quam erat vehicula metus, et condimentum ante tellus augue."
        
        let msg2 = "Cras efficitur bibendum mauris sed ultrices." +
                   "Phasellus tellus nisl, ullamcorper quis erat."
        
        let msg3 = "Maecenas finibus porta lacinia."
        
        let msg4 = "Pellentesque venenatis, ante et hendrerit rutrum" +
                   "Quam erat vehicula metus, et condimentum ante tellus augue."
        
        let msg5 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit." +
                   "Pellentesque venenatis, ante et hendrerit rutrum" +
                   "Quam erat vehicula metus, et condimentum ante tellus augue."

        
        messages.append(MockMessage(text: msg1, sender: currentSender, id: NSUUID().uuidString))
        messages.append(MockMessage(text: msg3, sender: sender1, id: NSUUID().uuidString))
        messages.append(MockMessage(text: msg2, sender: sender2, id: NSUUID().uuidString))
        messages.append(MockMessage(text: msg4, sender: currentSender, id: NSUUID().uuidString))
        messages.append(MockMessage(text: msg5, sender: sender3, id: NSUUID().uuidString))
    }
    
    func numberOfMessages(in collectionView: UICollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
}

struct MockMessage: MessageType {
    
    var messageId: String
    var sender: Sender
    var sentDate: Date
    var data: MessageData
    
    init(text: String, sender: Sender, id: String) {
        data = .text(text)
        self.sender = sender
        self.messageId = id
        self.sentDate = Date()
    }
    
    
}
