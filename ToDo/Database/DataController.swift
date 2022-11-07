//
//  DataController.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    
    static let shared = DataController()
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "ToDo")
        container.loadPersistentStores{description , error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    func save(completion : @escaping(Error?) -> () = {_ in}){
        let context = container.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                completion(error)
            }
        }
    }
    
    func delete(_ object : NSManagedObject, complation : @escaping (Error?) -> () = {_ in}){
        let context = container.viewContext
        context.delete(object)
        save(completion: complation) 
    }
}
