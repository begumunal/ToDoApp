//
//  ToDoList.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import SwiftUI

struct ToDoList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: ListItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ListItem.desc, ascending: true)],
        predicate: NSPredicate(format: "desc == %@", "ToDo")
    ) var listItems : FetchedResults<ListItem>
    //@FetchRequest(sortDescriptors: [])var listItems : FetchedResults<ListItem>
    @State var showAddItemView : Bool = false
    var body: some View {
        NavigationView{
            ScrollView{
                List(listItems){ item in
                    HStack{
                        //Text("\(item.description ?? "unknown")")
                           // .padding()
                        Text("deneme")
                            .padding()
                    }.swipeActions{
                        Button(action: { }, label: {
                            Image(systemName: "trash")
                        })
                    }
                    
                }.toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                        NavigationLink(destination: Home(), label: {
                            Image(systemName: "chevron.backward")})
                    }
                    ToolbarItem {
                        Button(action: {self.showAddItemView = true}) {
                            Image(systemName: "plus")
                        }
                        
                    }
                }
                NavigationLink( destination: AddItem(), isActive: $showAddItemView){
                    EmptyView()
                }
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
