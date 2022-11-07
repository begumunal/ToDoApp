//
//  ToDoApp.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import SwiftUI

@main
struct ToDoApp: App {
    let dataController = DataController.shared
    @Environment(\.scenePhase) var scenePhase
    //@StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }.onChange(of: scenePhase){(newScenePhase) in
            switch newScenePhase{
                 
            case .background:
                print("scene is bacground")
                dataController.save()
            case .inactive:
                print("scene is inactive")
            case .active:
                print("scene is active")
            @unknown default:
                print("Apple must have changed something")
            }
        }
    }
}
