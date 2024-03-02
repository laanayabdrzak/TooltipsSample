//
//  TooltipsSampleApp.swift
//  TooltipsSample
//
//  Created by LAANAYA Abderrazak on 2/3/2024.
//

import SwiftUI
import TipKit

@main
struct TooltipsSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    //try? Tips.resetDatastore() // for testing purpose
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
