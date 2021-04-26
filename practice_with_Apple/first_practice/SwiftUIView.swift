//
//  SwiftUIView.swift
//  first_practice
//
//  Created by 지민호 on 2021/04/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Image("logo")
            TextEditor(text: .constant("아이디"))
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
            
            TextEditor(text: .constant("비밀번호"))
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("로그인")/*@END_MENU_TOKEN@*/
                    
            }
            Image("symbol")
        }
        
        .padding()
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
