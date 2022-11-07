//
//  HomeController.swift
//  ToDo
//
//  Created by Begum Unal on 6.11.2022.
//

import Foundation
import SwiftUI
struct HomeController{
    
    private var homeModel = HomeModel()
    
    mutating func getSelectedDate(newValue : Date) -> String{
        homeModel.selectedDate = newValue
        homeModel.selectedDay = Calendar.current.dateComponents([.day], from: newValue).day!
        homeModel.selectedMonth = Calendar.current.dateComponents([.month], from: newValue).month!
        homeModel.selectedYear = Calendar.current.dateComponents([.year], from: newValue).year!
        var returnSelectedDate = "\(homeModel.selectedDay)" + "." + "\(homeModel.selectedMonth)" + "." + "\(homeModel.selectedYear)"
        return returnSelectedDate
    }
    
    mutating func getTodayDate() -> Date{
        var date : Date = Date()
       
        homeModel.todayDay = Calendar.current.dateComponents([.day], from: date).day!
        homeModel.todayMonth = Calendar.current.dateComponents([.month], from: date).month!
        homeModel.todayYear = Calendar.current.dateComponents([.year], from: date).year!
        
        //var returnTodayDate = "\(homeModel.todayDay)" + "." + "\(homeModel.todayMonth)" + "." + "\(homeModel.todayYear)"
        var returnTodayDate = date
        return returnTodayDate
    }
}
