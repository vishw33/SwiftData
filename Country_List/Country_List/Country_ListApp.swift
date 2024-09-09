//
//  Country_ListApp.swift
//  Country_List
//
//  Created by vishwas ng on 17/07/24.
//

import SwiftUI
import SwiftData

@main
struct Country_ListApp: App {
    var body: some Scene {
        WindowGroup {
            CountryScreen()
                .modelContainer(for:Country.self)
        }
    }
}
