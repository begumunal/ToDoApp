//
//  Home.swift
//  ToDo
//
//  Created by Begum Unal on 3.11.2022.
//

import SwiftUI
import CoreData
struct Home: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var listItems : FetchedResults<ListItem>
    @State var showToDoListView : Bool = false
    @State var date: Date = Date()
    @State var note : String = ""
    @State var startDate : Date = Date()
    @State var selectedDate : Date = Date()
    @State var selectedDay : Int = 0
    @State var selectedMonth : Int = 0
    @State var selectedYear : Int = 0
    @State var todayDay : Int = 0
    @State var todayMonth : Int = 0
    @State var todayYear : Int = 0
    
    init(){
       // getTodayDate()
    }
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .onChange(of: startDate){newValue in
                        getSelectedDate(newValue: newValue)
                        getTodayDate()
                    }
                    
                    HStack{
                        Text("note of the day")
                            .bold()
                        
                        Image(systemName: "pencil")
                            .font(.title)
                        Spacer()
                    }.padding()
                    
                    /*GeometryReader { geometry in
                        ScrollView {
                            TextField("note...",text: $note)
                                .lineLimit(nil)
                                .frame(width: geometry.size.width)
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .padding()
                                .background(Color(red:239/255,green:245/255,blue:250/255))
                                .cornerRadius(5)
                                .border(Color.gray)
                        }
                    }.padding()*/
                    ScrollView{
                       
                         TextField("note...",text: $note)
                            .padding()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .border(Color.gray)
                            .background(Color(red:239/255,green:245/255,blue:250/255))
                            .cornerRadius(5)
                            
                        if self.todayYear == self.selectedYear{
                            if self.todayMonth == self.selectedMonth{
                                if self.todayDay == self.selectedDay{
                                    //textField.hidden()
                                }
                            }
                            
                        }

                    }.padding()
                   
                    Spacer()
                    Button(action: {showToDoListView = true}, label: {Text("go to list")})
                    NavigationLink( destination: ToDoList(), isActive: $showToDoListView){
                        EmptyView()
                    }
                }
            }
        }
        
    }
    
    func getSelectedDate(newValue : Date){
        self.selectedDate = newValue
        self.selectedDay = Calendar.current.dateComponents([.day], from: newValue).day!
        self.selectedMonth = Calendar.current.dateComponents([.month], from: newValue).month!
        self.selectedYear = Calendar.current.dateComponents([.year], from: newValue).year!
    }
    func getTodayDate(){
        var date : Date = Date()
        //var components = DateComponents()
        self.todayDay = Calendar.current.dateComponents([.day], from: date).day!
        self.todayMonth = Calendar.current.dateComponents([.month], from: date).month!
        self.todayYear = Calendar.current.dateComponents([.year], from: date).year!
        
        /*self.todayDay = components.day!
        self.todayMonth = components.month!
        self.todayYear = components.year!*/
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
