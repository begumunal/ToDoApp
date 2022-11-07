//
//  AddItemController.swift
//  ToDo
//
//  Created by Begum Unal on 7.11.2022.
//

import Foundation
import SwiftUI
struct AddItemController{
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(
        entity: ListItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ListItem.desc, ascending: true)],
        predicate: NSPredicate(format: "desc == %@", "ToDo")
    ) var listItems : FetchedResults<ListItem>
    
    private var homeModel = HomeModel()
    private var itemModel = ItemModel()
    
    mutating func itemSave(){
        
        let item = ListItem(context: moc)
        item.id = UUID()
        item.desc = itemModel.textItem
        item.date = homeModel.date
        do{
            try moc.save()
            itemModel.backToDoListView = true
        }catch{
            print("VERİLER KAYDEDİLEMEDİ")
        }
    }
}
