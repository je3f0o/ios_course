//
//  ContentView.swift
//  BottomSheet
//
//  Created by Batkhishig on 2021.10.16.
//

import SwiftUI
import MapKit

struct MainUI: View {
    @State var sheet = false
        
    var body: some View {
        ZStack {
            Text("Hello Main UI")
                .foregroundColor(.white)
                .font(.title)
            
            BottomSheet()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

struct ContentView: View {
    
    var body: some View {
        ZStack {
            MapService.shared.view
            
            MainUI()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
