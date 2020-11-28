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
    var subTopics: Array<SubTopic>
}

struct PlayTopic {
    var title: String
    var pic: String
    var pointsNeeded: Int
    var segDesti: String
}

struct SubTopic {
    var title: String
    var pic: String
    var id: Int
    var content: SubContent
    var subTopics: Array<SubSubTopic>?
}

struct SubSubTopic {
    var topic: String
    var picture: String
    var id: Int
    var content: SubSubContent
}

struct SubContent {
    var definition: String
}

struct SubSubContent {
    var image: String
}

struct GameTopic {
    var title: String
    var pic: String
    var pointsNeeded: Int
}
