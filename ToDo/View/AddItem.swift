//
//  AddItem.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import SwiftUI
import CoreData
struct AddItem: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var listItems : FetchedResults<ListItem>
    @State var backToDoListView : Bool = false
    @State var textItem : String = ""
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    TextField("add to do", text: $textItem)
                        .padding(.horizontal)
                        .frame(height: 80)
                        .background(Color(.white))
                        .cornerRadius(10)
                    
                    Button(action: {
                       /* let item = ListItem(context: moc)
                        item.id = UUID()
                        item.desc = textItem
                        do{
                            try moc.save()
                            self.backToDoListView = true 
                        }catch{
                            
                        }*/
                       
                    }, label: {
                        Text("save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color(.blue))
                            .cornerRadius(10)
                    })
                    NavigationLink( destination: ToDoList(), isActive: $backToDoListView){
                        EmptyView()
                    }
                }.padding(14)
                
            }.navigationTitle("add item 🚀")
        }
       
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
            
    }
}
