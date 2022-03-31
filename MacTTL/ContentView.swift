//
//  ContentView.swift
//  MacTTL
//
//  Created by WaveTape on 30.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTTL = getCurrentTTL()
    
    var body: some View {
        VStack {
            Text("MacTTL").bold().font(.largeTitle)
            HStack(spacing: 0) {
                Text("Current TTL: ")
                Text(currentTTL).bold().lineLimit(1)
            }
            Button("Change to 64") {
                ttlChange(ttl: "64")
                self.currentTTL = getCurrentTTL()
            }
            .padding(.top, 10.0)
            Button("Change to 65") {
                ttlChange(ttl: "65")
                self.currentTTL = getCurrentTTL()
            }
            Text("With ❤️ by WaveTape").font(
                .system(size: 10, weight: .light))
            .padding(.top, 10.0)
            Text("Version: 1.0").font(
                .system(size: 8, weight: .light))
        }
        .frame(width: 300, height: 200)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
