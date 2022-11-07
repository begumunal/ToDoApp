//
//  AddItem.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import SwiftUI
import CoreData
struct AddItem: View {
    
    @State private var addItemController = AddItemController()
    @State private var itemModel = ItemModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    TextField("add to do", text: $itemModel.textItem)
                        .padding(.horizontal)
                        .frame(height: 80)
                        .background(Color(.white))
                        .cornerRadius(10)
                    
                    Button(action: {
                        addItemController.itemSave()
                       
                    }, label: {
                        Text("save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color(.blue))
                            .cornerRadius(10)
                    })
                    NavigationLink( destination: ToDoList(), isActive: $itemModel.backToDoListView){
                        EmptyView()
                    }
                }.padding(14)
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            NavigationLink(destination: ToDoList(), label: {
                                Image(systemName: "chevron.backward")})
                        }
                        
                    }
                
            }.navigationTitle("add item 🚀")
        }.navigationBarBackButtonHidden(true)
       
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
            
    }
}
