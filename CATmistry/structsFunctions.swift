//
//  structsFunctions.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import Foundation
import FirebaseDatabase
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
    var contentHeightDifference: Int
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

struct specificSeperationMethod: Hashable, Codable {
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

let decoder = JSONDecoder()


var learnTopics: [Topic] = []



var gameTopics: [PlayTopic] = []


var gasesArray: [GasTestGame] = []



var phGameArray: [[PhGame]] = []


var phGameOptionsArray: [PhOption] = []

var phGameAcidicUniversalStartColour = "monster-ph4.png"

var phGameAlkalinUniversalStartColour = "monster-ph10.png"


var periodicTable: [[PeriodicTableGame]] = []



var retrieveSolidsArray: [specificSeperationMethod] = []

// MARK: - Functions

func changePoints(_ valueChanged: Int){
    points += valueChanged
    if (points < 0) {
        points = 0
    }
    let ud = UserDefaults.standard
    ud.set(points, forKey: "points")
}

// MARK: - Fonts

import UIKit

struct AppFontName {
    static let regular = "OpenDyslexic-BoldItalic"
    static let bold = "OpenDyslexic-BoldItalic"
    static let italic = "OpenDyslexic-BoldItalic"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    static var isOverrided: Bool = false
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
    
    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: size)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
            self.init(myCoder: aDecoder)
            return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.bold
        case "CTFontObliqueUsage":
            fontName = AppFontName.italic
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self, !isOverrided else { return }
        
        // Avoid method swizzling run twice and revert to original initialize function
        isOverrided = true
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
           let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
           let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
           let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
           let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}

func loadData(versionNumber: Int, tableView: UITableView) {
    
    var ref: DatabaseReference!
    
    ref = Database.database().reference(withPath: "learnTopics")
    ref.keepSynced(true)
    ref!.observe(.value, with: { (snapshot) in
        
        let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
        
        learnTopics = try! JSONDecoder().decode([Topic].self, from: jsonData)
        
        tableView.reloadData()
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(learnTopics) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "learnTopics")
        }
    })
    
    let ref2 = Database.database().reference(withPath: "gasesArray")
    ref2.keepSynced(true)
    ref2.observe(.value, with: { (snapshot) in
        
        let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
        
        gasesArray = try! JSONDecoder().decode([GasTestGame].self, from: jsonData)
        
        gasesArray.shuffle()
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(gasesArray) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "gasesArray")
        }
        
    })
    
    let ref3 = Database.database().reference(withPath: "gameTopics")
    ref3.keepSynced(true)
    ref3.observe(.value, with: { (snapshot) in
        
        let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
        
        gameTopics = try! JSONDecoder().decode([PlayTopic].self, from: jsonData)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(gameTopics) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "gameTopics")
        }
    })
    
    let ref4 = Database.database().reference(withPath: "periodicTable")
    ref4.keepSynced(true)
    ref4.observe(.value, with: { (snapshot) in
        
        let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
        
        periodicTable = try! JSONDecoder().decode([[PeriodicTableGame]].self, from: jsonData)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(periodicTable) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "periodicTable")
        }
    })
    
    let ref5 = Database.database().reference(withPath: "phGameArray")
    ref5.keepSynced(true)
    ref5.observe(.value, with: { (snapshot) in
        
        let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
        
        phGameArray = try! JSONDecoder().decode([[PhGame]].self, from: jsonData)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(phGameArray) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "phGameArray")
        }
    })
    
    let ref6 = Database.database().reference(withPath: "phGameOptionsArray")
    ref6.keepSynced(true)
    ref6.observe(.value, with: { (snapshot) in
        
        let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
        
        phGameOptionsArray = try! JSONDecoder().decode([PhOption].self, from: jsonData)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(phGameOptionsArray) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "phGameOptionsArray")
        }
    })
    
    let ref7 = Database.database().reference(withPath: "retrieveSolidsArray")
    ref7.keepSynced(true)
    ref7.observe(.value, with: { (snapshot) in
        
        let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
        
        retrieveSolidsArray = try! JSONDecoder().decode([specificSeperationMethod].self, from: jsonData)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(retrieveSolidsArray) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "retrieveSolidsArray")
            
            defaults.set(versionNumber, forKey: "versionNumber")
        }
    })
    
    
    
}

func getData(keyName name: String) -> Data? {
    let defaults = UserDefaults.standard
    return (defaults.object(forKey: name) as? Data)
}
