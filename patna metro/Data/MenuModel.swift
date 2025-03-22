//
//  HomePageMenu.swift
//  patna metro
//
//  Created by shashwat singh on 14/02/25.
//

struct MenuItem:Hashable {
    let mainLine: String
    let secondLine: String
    let moduleID: Int
    let imageurl: String
}

let MenuItems :[MenuItem] = [
    MenuItem(mainLine: "Find your route", secondLine: "Start, end and time", moduleID: 0, imageurl: "routeimg"),
    MenuItem(mainLine: "Map", secondLine: "Check your route", moduleID: 1, imageurl: "mapimg"),
    MenuItem(mainLine: "Fare", secondLine: "Know your fare", moduleID: 2, imageurl: "ticketimg"),
    MenuItem(mainLine: "Enquiry", secondLine: "Ask your Queires", moduleID: 3, imageurl: "queryimg")
]
