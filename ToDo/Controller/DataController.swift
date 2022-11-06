//
//  DataController.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    let container = NSPersistentContainer(name: "ToDo")
    
    init(){
        container.loadPersistentStores{description , error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
}
