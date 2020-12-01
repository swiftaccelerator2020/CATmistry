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
    var errorLabel: String
}

struct PlayTopic {
    var title: String
    var pic: String
    var pointsNeeded: Int
    var segDesti: String
    var errorLabel: String
}

struct SubTopic {
    var title: String
    var pic: String
    var needSlider: Bool
    var content: SubContent
    var subTopics: Array<SubSubTopic>?
    var navTitle: String
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
    var firstAttributionText: String
    var secondAttributionText: String
    var thirdAttributionText: String
    var lowpH: Float? = nil
    var highpH: Float? = nil
    var lowpHColor: String? = nil
    var middlepHColor: String? = nil
    var highpHColor: String? = nil
    var lowpHColorName: String? = nil
    var middlepHColorName: String? = nil
    var highpHColorName: String? = nil
}

struct GameTopic {
    var title: String
    var pic: String
    var pointsNeeded: Int
}

struct QuizTopic {
    var questions: [QuizQuestion]
}

struct QuizQuestion {
    var question: String
    var options: [String]
    var correctAnswer: Int
}


var learnTopics = [
    Topic(title: "Gas Tests", pic: "gas-tests.png", pointsNeeded: 0, subTopics: [
        SubTopic(title: "What are Gas Tests?", pic: "gas-tests.png", needSlider: false, content:
                    SubContent(definition: "some filler text for show"),
                 subTopics: [
                    SubSubTopic(topic: "Test for H₂", picture: "h2.png", id: 1, content: SubSubContent(image: "pic.png", firstAttributionText: "test1", secondAttributionText: "test", thirdAttributionText: "test3")),
                    SubSubTopic(topic: "Test for CO₂", picture: "co2.png", id: 2, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
                    SubSubTopic(topic: "Test for O₂", picture: "o2.png", id: 3, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
                    SubSubTopic(topic: "Test for NH₃", picture: "nh3.png", id: 4, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: ""))
                 ], navTitle: "Gas Tests"),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Take the Quiz")
    ], errorLabel: ""),
    
    Topic(title: "Separation Methods", pic: "separation-methods.png", pointsNeeded: 10, subTopics: [
        SubTopic(title: "What is Separation?", pic: "separation-methods.png", needSlider: false, content: SubContent(definition: "A separation process is a method that converts a mixture or solution of chemical substances into two or more distinct product mixtures. \n\nSeparations exploit differences in chemical properties or physical properties (such as size, shape, mass, density, or chemical affinity) between the constituents of a mixture."), subTopics: [], navTitle: "Separation"),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Take the Quiz")
    ], errorLabel: "Please complete Chapter 1"),
    
    Topic(title: "pH and Indicators", pic: "pH-and-indicators.png", pointsNeeded: 20, subTopics: [
        SubTopic(title: "What is pH?", pic: "pH.png", needSlider: true, content: SubContent(definition: "pH (the Power of Hydrogen) is a scale of 1 to 14 used to specify the acidity or basicity of a solution. The pH scale indicates the concentration of hydrogen ions in a solution.\n\nA lower pH (1 - 6.9) indicates that the solution is acidic, while a higher pH (7.1 - 14) indicates that the solution is alkaline. A pH of 7 indicates that the solution is neutral (neither acidic nor alkaline)."), subTopics: nil, navTitle: "pH"),
        SubTopic(title: "What are Indicators?", pic: "pH-and-indicators.png", needSlider: false, content: SubContent(definition: "Indicators are chemicals which turn into different colours depending on the pH of the solution. \n\nThe transition range is the range in which the indicator changes from one colour to the other."), subTopics: [
            SubSubTopic(topic: "Methyl Orange", picture: "methyl-orange.jpg", id: 2, content: SubSubContent(image: "methyl-orange.jpg", firstAttributionText: "", secondAttributionText: "Colour Below Transition Range: Red \nTransition Range: pH 3.1 to pH 4.4 \nColour Above Transition Range: Yellow", thirdAttributionText: "Try out the interactive slider below:", lowpH: 3.1, highpH: 4.4, lowpHColor: "FF0000", middlepHColor: "FF7500", highpHColor: "FFE600", lowpHColorName: "Red", middlepHColorName: "Orange", highpHColorName: "Yellow")),
            SubSubTopic(topic: "Litmus", picture: "litmus.png", id: 1, content: SubSubContent(image: "litmus.png", firstAttributionText: "", secondAttributionText: "Colour Below Transition Range: Red \nTransition Range: pH 4.5 to pH 8.3 \nColour Above Transition Range: Blue", thirdAttributionText: "Try out the interactive slider below:", lowpH: 4.5, highpH: 8.3, lowpHColor: "", middlepHColor: "", highpHColor: "", lowpHColorName: "Red", middlepHColorName: "Purple", highpHColorName: "Blue")),
            SubSubTopic(topic: "Phenolphthalein", picture: "phenolphthalein.png", id: 1, content: SubSubContent(image: "methyl-orange.png", firstAttributionText: "", secondAttributionText: "Colour Below Transition Range: Colourless \nTransition Range: pH 8.3 to pH 10.0 \nColour Above Transition Range: Pink", thirdAttributionText: "Try out the interactive slider below:", lowpH: 8.3, highpH: 10.0, lowpHColor: "", middlepHColor: "", highpHColor: "", lowpHColorName: "Colourless", middlepHColorName: "Light Pink", highpHColorName: "Pink")),
            SubSubTopic(topic: "Screened Methyl Orange", picture: "screened-methyl-orange.png", id: 1, content: SubSubContent(image: "methyl-orange.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 1, highpH: 1, lowpHColor: "", middlepHColor: "", highpHColor: "", lowpHColorName: "", middlepHColorName: "", highpHColorName: "")),
            SubSubTopic(topic: "Thymol Blue", picture: "thymol-blue.png", id: 1, content: SubSubContent(image: "methyl-orange.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 1, highpH: 1, lowpHColor: "", middlepHColor: "", highpHColor: "", lowpHColorName: "", middlepHColorName: "", highpHColorName: "")),
            SubSubTopic(topic: "Universal Indicator", picture: "universal-indicator.png", id: 1, content: SubSubContent(image: "methyl-orange.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 1, highpH: 1, lowpHColor: "", middlepHColor: "", highpHColor: "", lowpHColorName: "", middlepHColorName: "", highpHColorName: ""))
        ], navTitle: "Indicators"),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Take the Quiz")
    ], errorLabel: "Please complete Chapter 2"),
    
    Topic(title: "Periodic Table", pic: "periodic-table.png", pointsNeeded: 30, subTopics: [
        SubTopic(title: "What is the Periodic Table?", pic: "periodic-table.png", needSlider: false, content: SubContent(definition: "A periodic table is a chart that shows chemical elements in order of their atomic number. \n\nElements with similar properties are arranged in the same column (group), and elements with the same number of electron shells are arranged in the same row (period)."), subTopics: [], navTitle: "Periodic Table"),
        SubTopic(title: "What are Elements?", pic: "element.png", needSlider: false, content: SubContent(definition: ""), subTopics: nil, navTitle: "Elements"),
        SubTopic(title: "First 18 Elements", pic: "periodic-table.png", needSlider: false, content: SubContent(definition: ""), subTopics: [
            SubSubTopic(topic: "1 - Hydrogen", picture: "pic.png", id: 1, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: ""))
        ], navTitle: "First 18 Elements"),
        SubTopic(title: "Groups' Properties", pic: "periodic-table.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Groups' Properties"),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Take the Quiz")
    ], errorLabel: "Please complete Chapter 3"),
]

var gameTopics = [
    PlayTopic(title: "Diffusion", pic: "gas-tests.png", pointsNeeded: 10, segDesti: "diff", errorLabel: "Please complete Chapter 1"),
    PlayTopic(title: "Retreive the solids", pic: "separation-methods.png", pointsNeeded: 20, segDesti: "sepe", errorLabel: "Please complete Chapter 2"),
    PlayTopic(title: "Get the PH Right", pic: "pH-and-indicators.png", pointsNeeded: 30, segDesti: "phAndIndi", errorLabel: "Please complete Chapter 3"),
    PlayTopic(title: "Identify the elements", pic: "periodic-table.png", pointsNeeded: 40, segDesti: "periodic", errorLabel: "Please complete Chapter 4")
]
