//
//  MemorizeApp.swift
//  Shared
//
//  Created by Scott Nicholes on 4/18/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(game: IconMemoryGame())
        }
    }
}
