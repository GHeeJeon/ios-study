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
            destination: NextView(),
            label: {
                Text("Navigate")
            })
    }
}
    }
}

struct NextView: View {
    var body: some View {
        VStack {
            Text("두번째 화면")
            
            NavigationLink(
                destination: FinalView(),
                label: {
                    Text("Navigate")
                })
        }
    }
}

struct FinalView: View {
    var body: some View {
        Text("마지막 화면")
        
        NavigationLink(
            destination: ContentView(),
            label: {
                Text("Navigate")
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
