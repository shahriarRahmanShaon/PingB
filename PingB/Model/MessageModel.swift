//
//  MessageModel.swift
//  PingB
//
//  Created by sergio shaon on 21/2/22.
//

import Foundation

struct MessageModel: Codable, Identifiable{
    
    let id: String
    let message: String
    let received: Bool
    let timestamp: Date
}
