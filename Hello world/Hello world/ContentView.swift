//
//  ContentView.swift
//  Hello world
//
//  Created by Batkhishig on 2021.10.10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Circle()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.red)
        //.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
