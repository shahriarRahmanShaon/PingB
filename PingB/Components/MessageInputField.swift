//
//  MessageInputField.swift
//  PingB
//
//  Created by sergio shaon on 21/2/22.
//

import SwiftUI

struct MessageInputField: View {
    
    @State private var message = ""
    @EnvironmentObject var sendMessage: MessageManagementViewModel
    
    var body: some View {
        HStack {
            TextField("Enter your message here", text: $message)
            Button {
                print("Message sent!")
                sendMessage.sendMessage(messageTosend: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("Peach"))
                    .cornerRadius(50)
                
            }
            
        }
        .padding()
        .background(Color("Gray"))
        .cornerRadius(30)
    }
}

struct MessageInputField_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputField()
            //.previewLayout(.sizeThatFits)
            .environmentObject(MessageManagementViewModel())
    }
}
