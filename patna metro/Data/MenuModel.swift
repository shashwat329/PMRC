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
    MenuItem(mainLine: "Route", secondLine: "Find your Route", moduleID: 0, imageurl: "routeimg"),
    MenuItem(mainLine: "Map", secondLine: "Check your route", moduleID: 1, imageurl: "mapimg"),
    MenuItem(mainLine: "Fare", secondLine: "Know your fare", moduleID: 2, imageurl: "ticketimg"),
    MenuItem(mainLine: "Parking", secondLine: "Looking for parking", moduleID: 3, imageurl: "queryimg")
]
let menuSubItems: [MenuItem] = [
    MenuItem(mainLine: "Share", secondLine: "Find your Route", moduleID: 4, imageurl: "routeimg"),
    MenuItem(mainLine: "Rate Us", secondLine: "Find your Route", moduleID: 5, imageurl: "routeimg"),
    MenuItem(mainLine: "About", secondLine: "Find your Route", moduleID: 6, imageurl: "routeimg"),
    MenuItem(mainLine: "Disclaimer", secondLine: "Find your Route", moduleID: 7, imageurl: "routeimg"),
    MenuItem(mainLine: "inforamtion", secondLine: "Find your Route", moduleID: 8, imageurl: "routeimg"),
    MenuItem(mainLine: "Contact Us", secondLine: "Find your Route", moduleID: 9, imageurl: "routeimg"),
]
