//
//  TitleRow.swift
//  PingB
//
//  Created by sergio shaon on 21/2/22.
//

import SwiftUI

struct TitleRow: View {
    var body: some View {
        HStack{
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            VStack(alignment: .leading){
                Text("Sergio Shaon")
                    .font(.title)
                    .bold()
                Text("Online")
                    .opacity(0.5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "phone")
                .padding()
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(50)
        }
        .padding()
        .background(Color("Peach"))
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
    }
}
