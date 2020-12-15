//
//  structsFunctions.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import Foundation

// MARK: - Structs

struct Topic: Codable {
    var title: String
    var pic: String
    var pointsNeeded: Int
    var subTopics: Array<SubTopic>
    var errorLabel: String
    var questions: [QuizQuestion]
}

struct PlayTopic: Codable {
    var title: String
    var pic: String
    var pointsNeeded: Int
    var segDesti: String
    var errorLabel: String
}

struct SubTopic: Codable {
    var title: String
    var pic: String
    var needSlider: Bool
    var content: SubContent
    var subTopics: Array<SubSubTopic>?
    var navTitle: String
    var contentHeightDifference: Int? = nil
}

struct SubSubTopic: Codable {
    var topic: String
    var picture: String
    var id: Int
    var content: SubSubContent
}

struct SubContent: Codable {
    var definition: String
}

struct SubSubContent: Codable {
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
    var warningText: String? = nil
}

struct GameTopic: Codable {
    var title: String
    var pic: String
    var pointsNeeded: Int
}

struct QuizQuestion: Codable {
    var question: String
    var options: [String]
    var correctAnswer: Int
}

struct GasTestGame: Codable {
    var firstGasTank: String
    var secondGasTank: String
    var thirdGasTank: String
    var fourthGasTank: String
    var firstGasIsPositive: [Bool]
    var secondGasIsPositive: [Bool]
    var thirdGasIsPositive: [Bool]
    var forthGasIsPositive: [Bool]
    var correctGasTank: String
}

struct SpecificSeperationMethod: Hashable, Codable {
    var name: String
    var properties: String
    var givenMethods: GivenSeperationMethods

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(properties)
        hasher.combine(givenMethods)
    }
}

struct GivenSeperationMethods: Hashable, Codable {
    var methods: [SeperationMethods]

    func hash(into hasher: inout Hasher) {
        hasher.combine(methods)
    }
}

struct SeperationMethods: Hashable, Codable {
    var methodName: String
    var isCorrect: Bool

    func hash(into hasher: inout Hasher) {
        hasher.combine(methodName)
        hasher.combine(isCorrect)
    }
}

struct PhGame: Codable {
    var startIsAcidic: Bool
    var indicatorButtonText: String? = nil
}

struct PhOption: Hashable, Codable {
    var name: String
    var image: String
    var turnUniversalTankColour: String
    var isAcidic: Bool? = true

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(image)
        hasher.combine(turnUniversalTankColour)
        hasher.combine(isAcidic)
    }
}

struct PeriodicTableGame: Codable {
    var properties: String
    var correctAns1: Int
    var correctAns2: Int
    var timeGiven: Int
}

struct SettingsContent: Codable {
    var labelText: String
    var type: String
    var emojiImage: String
}
// MARK: - Arrays
private func getDataFromJsonAppbundleFile<T: Decodable>(filename: String, dataType _: T.Type) -> T? {
      if let filepath = Bundle.main.path(forResource: filename, ofType: nil) {
          do {
              let contents = try String(contentsOfFile: filepath)

              if let contentsData = contents.data(using: .utf8) {
                  let result = try JSONDecoder().decode(T.self, from: contentsData)
                  return result
              }

          } catch {
              print(error)
          }
      } else {
          print("\(filename) not found :O")
      }
      return nil
  }

let learnTopics = getDataFromJsonAppbundleFile(filename: "learnTopics.json", dataType: [Topic].self)!

let gameTopics = getDataFromJsonAppbundleFile(filename: "gameTopics.json", dataType: [PlayTopic].self)!

let gasTestsGameArray = getDataFromJsonAppbundleFile(filename: "gasTestsGameArray", dataType: [GasTestGame].self)!

let phGameArray = getDataFromJsonAppbundleFile(filename: "phGameArray", dataType: [[PhGame]].self)!

let phGameOptionsArray = getDataFromJsonAppbundleFile(filename: "phGameOptionsArray", dataType: [PhOption].self)!

let phGameAcidicUniversalStartColour = "monster-ph4.png"

let phGameAlkalinUniversalStartColour = "monster-ph10.png"

let perioicTable = getDataFromJsonAppbundleFile(filename: "perioicTable", dataType: [[PeriodicTableGame]].self)!

let retrieveSolidsArray = getDataFromJsonAppbundleFile(filename: "retrieveSolidsArray", dataType: [SpecificSeperationMethod].self)!

// MARK: - Functions

func changePoints(_ valueChanged: Int){
    points += valueChanged
    if (points < 0) {
        points = 0
    }
    let ud = UserDefaults.standard
    ud.set(points, forKey: "points")
}
