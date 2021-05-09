//
//  ContentView.swift
//  homework2_reference
//
//  Created by 지민호 on 2021/05/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
NavigationView {
    VStack {
        
        Text("Hello")
            .navigationTitle("첫번째 페이지")
        
        NavigationLink(
            destination: FinalView(),
            label: {
                Button
                Text("다음 페이지")
             })
    }
}
    }
}
struct FinalView: View {
    var body: some View {
        Text("마지막 화면")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
