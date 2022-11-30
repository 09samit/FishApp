//
//  FishAppApp.swift
//  FishApp
//
//  Created by Amit Garg on 01/08/22.
//

import SwiftUI

@main
struct FishAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabbarView(viewRouter: ViewRouter())
        }
    }
}
