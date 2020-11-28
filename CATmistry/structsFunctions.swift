//
//  structsFunctions.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import Foundation

struct Topic {
    var title: String
    var pic: String
    var pointsNeeded: Int
    var topics: Array<SpecificTopic>
}

struct SpecificTopic{
    var topics: String
    var picture: String
    var id: Int
    var content: String
}

struct GameTopic{
    var title: String
    var pic: String
    var pointsNeeded: Int
}
