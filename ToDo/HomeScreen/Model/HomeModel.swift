//
//  HomeModel.swift
//  ToDo
//
//  Created by Begum Unal on 6.11.2022.
//

import Foundation

struct HomeModel{
    var showToDoListView : Bool = false
    var date: Date = Date()
    var note : String = ""
    var startDate : Date = Date()
    var selectedDate : Date = Date()
    var selectedDay : Int = 0
    var selectedMonth : Int = 0
    var selectedYear : Int = 0
    var todayDay : Int = 0
    var todayMonth : Int = 0
    var todayYear : Int = 0
}
