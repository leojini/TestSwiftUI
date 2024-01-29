//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Leojin on 2024/01/27.
//

import SwiftUI

struct ContentView: View {
    @State private var showing = false
    @State private var showingSheet = false
    
    var body: some View {
        TabView {
            TabView1()
                .tabItem({
                    Image(systemName: "message")
                    Text("메세지")
                })
            TabView2()
                .tabItem({
                    Image(systemName: "phone")
                    Text("전화")
                })
            TabView3()
                .tabItem({
                    Image(systemName: "envelope")
                    Text("편지")
                })
        }
        .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
