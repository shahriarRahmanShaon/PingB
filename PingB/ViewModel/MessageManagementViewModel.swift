//
//  MessageManagementViewModel.swift
//  PingB
//
//  Created by sergio shaon on 21/2/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManagementViewModel: ObservableObject {
    
    @Published var message = [MessageModel]()
    @Published var lastMessageIdForScollingToTheLast = ""
    private let db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    func fetchData(){
        db.collection("messages").addSnapshotListener{ documentSnapShot, error in
            guard let documents = documentSnapShot?.documents else{
                print("failed fetching data from cloud")
                return
            }
            self.message = documents.compactMap{ document -> MessageModel? in
                do{
                    let data = try document.data(as: MessageModel.self)
                    return data
                }catch{
                    print("something is wrong with convertion")
                    return nil
                }
                
            }
            self.message.sort { $0.timestamp < $1.timestamp}
            if let id = self.message.last?.id{
                self.lastMessageIdForScollingToTheLast = id
            }
        }
    }
    
    func sendMessage(messageTosend: String){
        let typedMessage = MessageModel(id: "\(UUID())", message: messageTosend, received: false, timestamp: Date())
        do{
            try db.collection("messages").document().setData(from: typedMessage)
        }catch{
            print("sending failed")
        }
    }
}
