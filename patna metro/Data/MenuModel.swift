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
    let image: String?
}

let MenuItems :[MenuItem] = [
    MenuItem(mainLine: "Find your route", secondLine: "Start, end and time", moduleID: 0, image: ""),
    MenuItem(mainLine: "Map", secondLine: "Check your route", moduleID: 1, image: ""),
    MenuItem(mainLine: "Fare", secondLine: "Know your fare", moduleID: 2, image: ""),
    MenuItem(mainLine: "Enquiry", secondLine: "Ask your Queires", moduleID: 3, image: "")
]
