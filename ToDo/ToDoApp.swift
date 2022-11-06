//
//  ToDoApp.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import SwiftUI

@main
struct ToDoApp: App {
    let persistenceController = PersistenceController.shared

    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
