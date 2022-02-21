//
//  ContentView.swift
//  PingB
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var messageManagerVM = MessageManagementViewModel()
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                ScrollViewReader { proxy in 
                    ScrollView{
                        ForEach(messageManagerVM.message, id: \.id){ gotMessage in
                            MessageBubble(message: gotMessage)
                        }
                    }
                    .onChange(of: messageManagerVM.lastMessageIdForScollingToTheLast, perform: { newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .bottom)
                        }
                    })
                    .padding(.top, 15)
                    .background(.white)
                .cornerRadius(40, corners: [.topLeft, .topRight])
                }
            }.background(Color("Peach"))
            MessageInputField()
                .environmentObject(messageManagerVM )
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MessageManagementViewModel())
    }
}
