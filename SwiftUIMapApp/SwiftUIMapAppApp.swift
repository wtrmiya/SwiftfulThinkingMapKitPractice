//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Wataru Miyakoshi on 2024/04/01.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @StateObject private var viewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
