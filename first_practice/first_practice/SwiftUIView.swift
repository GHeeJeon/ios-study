//
//  SwiftUIView.swift
//  first_practice
//
//  Created by 지민호 on 2021/04/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Image("logo")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
