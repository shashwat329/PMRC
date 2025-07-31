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
    MenuItem(mainLine: "Share", secondLine: "", moduleID: 4, imageurl: "share"),
    MenuItem(mainLine: "Rate Us", secondLine: "", moduleID: 5, imageurl: "rateus"),
    MenuItem(mainLine: "About Us", secondLine: "", moduleID: 6, imageurl: "aboutUs"),
    MenuItem(mainLine: "Disclaimer", secondLine: "", moduleID: 7, imageurl: "disclaimer"),
    MenuItem(mainLine: "inforamtion", secondLine: "", moduleID: 8, imageurl: "info"),
    MenuItem(mainLine: "Contact Us", secondLine: "", moduleID: 9, imageurl: "contactUs"),
]
