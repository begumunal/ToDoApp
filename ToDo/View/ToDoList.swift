//
//  ToDoList.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import SwiftUI

struct ToDoList: View {
    @FetchRequest(sortDescriptors: [])var listItems : FetchedResults<ListItem>
    @State var showAddItemView : Bool = false
    var body: some View {
        NavigationView{
            ScrollView{
                List(listItems){ item in
                    Text(item.description ?? "unknown")
                        .padding()
                    
                }.toolbar {
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
            
        }//.navigationBarBackButtonHidden(true)
        
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
