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
    @State private var homeModel = HomeModel()
    @State private var lineModel = LineModel()
    @State private var lines : [LineModel] = []
    @State private var homeController = HomeController()
    @State private var selectedColor : Color = .red
    @State private var todayDate : Date = Date()
    @State private var selectedDate : String = ""
    
    init(){
        self.todayDate = homeController.getTodayDate()
    }
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    DatePicker(
                        "Start Date",
                        selection: $homeModel.date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .onChange(of: homeModel.startDate){newValue in
                        homeController.getSelectedDate(newValue: newValue)
                        print("SEÇİLEN TARİH DEĞİŞTİRİLDİ")
                        //homeController.getTodayDate()
                    }
                    HStack{
                        Text("Draw something for today")
                            .bold()
                        
                        Image(systemName: "pencil")
                            .font(.title)
                        Spacer()
                    }.padding()
                    
                    VStack{
                        Canvas{context , size in
                            for line in lines{
                                var path = Path()
                                path.addLines(line.points)
                                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                            }
                        }.gesture(DragGesture(minimumDistance: 0,coordinateSpace: .local)
                            .onChanged({ value in
                                let newPoint = value.location
                                lineModel.points.append(newPoint)
                                self.lines.append(lineModel)
                            })
                                .onEnded({value in
                                   // self.lines.append(lineModel)
                                    self.lineModel = LineModel(points: [],color: selectedColor)
                                })
                        )
                        .padding()
                        .cornerRadius(10)
                        .background(Color.canvasColor)
                        
                        ColorPicker(selectedColor: $selectedColor)
                            .onChange(of: selectedColor){newColor in
                                lineModel.color = newColor
                            }
                    }.frame(minWidth: 300,minHeight: 270)
                   
                    Spacer()
                    Button(action: {homeModel.showToDoListView = true}, label: {Text("go to list")})
                        .padding()
                    NavigationLink( destination: ToDoList(), isActive: $homeModel.showToDoListView){
                        EmptyView()
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        
    }
    
    
}
extension Color{
    static let canvasColor = Color("CanvasColor")
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
