//
//  AnyAppApp.swift
//  AnyApp
//
//  Created by Brennan Stehling on 11/13/21.
//

import SwiftUI

@main
struct AnyAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AppEnvironment())
        }
    }
}
