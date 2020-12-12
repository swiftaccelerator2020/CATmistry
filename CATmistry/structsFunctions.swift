//
//  structsFunctions.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import Foundation

// MARK: - Structs

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
    var warningText: String? = nil
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

struct GasTestGame {
    var firstGasTank: String
    var secondGasTank: String
    var thirdGasTank: String
    var fourthGasTank: String
    var correctGasTank: String
}

struct specificSeperationMethod: Hashable{
    var name: String
    var properties: String
    var givenMethods: GivenSeperationMethods

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(properties)
        hasher.combine(givenMethods)
    }
}

struct GivenSeperationMethods: Hashable{

    var methods: [SeperationMethods]

    func hash(into hasher: inout Hasher) {
        hasher.combine(methods)
    }
}

struct SeperationMethods: Hashable{
    var methodName: String
    var isCorrect: Bool

    func hash(into hasher: inout Hasher) {
        hasher.combine(methodName)
        hasher.combine(isCorrect)
    }
}

struct PhGame {
    var startIsAcidic: Bool
    var indicatorButtonText: String? = nil
}

struct PhOption: Hashable {
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

struct periodicTableGame {
    var properties: String
    var correctAns1: Int
    var correctAns2: Int
    var timeGiven: Int
}

// MARK: - Arrays

var learnTopics = [
    Topic(title: "Gas Tests", pic: "gas-tests.png", pointsNeeded: 0, subTopics: [
        SubTopic(title: "What are Gas Tests?", pic: "gas-tests.png", needSlider: false, content:
                    SubContent(definition: "some filler text for show"),
                 subTopics: [
                    SubSubTopic(topic: "Test for CO₂", picture: "co2.png", id: 2, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
                    SubSubTopic(topic: "Test for H₂", picture: "h2.png", id: 1, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "", warningText: "⚠️ Lighted splint, not glowing splint")),
                    SubSubTopic(topic: "Test for O₂", picture: "o2.png", id: 3, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "", warningText: "⚠️ Glowing splint, not lighted splint")),
                    SubSubTopic(topic: "Test for NH₃", picture: "nh3.png", id: 4, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "", warningText: "⚠️ Remember to heat the mixture first!"))
                 ], navTitle: "Gas Tests"),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Take the Quiz")
    ], errorLabel: ""),

    Topic(
        title: "Separation Methods",
        pic: "separation-methods.png",
        pointsNeeded: 10,
        subTopics: [
            SubTopic(
                title: "What is Separation?",
                pic: "separation-methods.png",
                needSlider: false,
                content: SubContent(
                    definition: "Separation process: \nMethod that converts a mixture/solution of chemical substances into 2 or more mixtures \n\nSeparation exploits differences in chemical properties or physical properties between the parts of a mixture, such as: \n- Size \n- Shape \n- Mass \n- Density \n- Magnetic Conductivity"
                ),
                subTopics: [
                    SubSubTopic(
                        topic: "Evaporation",
                        picture: "evaporation.png",
                        id: 1, content: SubSubContent(
                            image: "evaporation.png",
                            firstAttributionText: "Separates: Solube Solid from Solution",
                            secondAttributionText: "Properties Involed: Themal Stability of Solid",
                            thirdAttributionText: "Principle of Separation: Liquid evaportes away, leaving behind solid"
                        )
                    ),
                    SubSubTopic(
                        topic: "Distillation",
                        picture: "distillation.png",
                        id: 2,
                        content: SubSubContent(
                            image: "distillation.png",
                            firstAttributionText: "Separates: Two or more miscible liquids",
                            secondAttributionText: "Properties Involed: Difference of boiling points of Liquids",
                            thirdAttributionText: "Principle of Separation: The liquid with the lower boiling point will distill first"
                        )
                    ),
                    SubSubTopic(
                        topic: "Filtration",
                        picture: "separation-methods.png",
                        id: 3,
                        content: SubSubContent(
                            image: "separation-methods.png",
                            firstAttributionText: "Separates: Insoluble solid from solid-liquid mixture",
                            secondAttributionText: "Properties Involed: Size of particles - small particle size",
                            thirdAttributionText: "Principle of Separation: Filter paper prevents large particles from passing through"
                        )
                    ),
                    SubSubTopic(
                        topic: "Magnetism",
                        picture: "magnetism.png",
                        id: 4,
                        content: SubSubContent(
                            image: "magnetism.png",
                            firstAttributionText: "Separates: Magnetic solid from solid-solid mixture",
                            secondAttributionText: "Properties Involed: Magnetism",
                            thirdAttributionText: "Principle of Separation: Magnetic solid will be attracted to the magnet"
                        )
                    ),
                    SubSubTopic(
                        topic: "Crystallisation",
                        picture: "crystallisation.png",
                        id: 5,
                        content: SubSubContent(
                            image: "crystallisation.png",
                            firstAttributionText: "Separates: Soluble solid from solid-liquid mixture",
                            secondAttributionText: "Properties Involed: Solubility changes with temperature",
                            thirdAttributionText: "Principle of Separation: When the solubility of the solid decreases as the temperature of the mixture decreases, the solids that cannot be dissolved will crystallise"
                        )
                    )
                ],
                navTitle: "Separation"
            ),
            SubTopic(
                title: "Take the Quiz",
                pic: "quiz.png",
                needSlider: false,
                content: SubContent(definition: ""),
                subTopics: [],
                navTitle: "Take the Quiz"
            )
        ],
        errorLabel: "Please complete Chapter 1"),

    Topic(title: "pH and Indicators", pic: "pH-and-indicators.png", pointsNeeded: 20, subTopics: [
        SubTopic(title: "What is pH?", pic: "pH.png", needSlider: true, content: SubContent(definition: "pH means Power of Hydrogen (concentration of hydrogen ions). \n\nIt is represented on a scale of 1 to 14, which is used to specify the acidity or basicity/alkalinity of a solution. \n\npH 1 - 6.9: Acidic \npH 7.1 - 14:  Alkaline \npH 7: Neutral (neither acidic nor alkaline)"), subTopics: nil, navTitle: "pH"),
        SubTopic(title: "What are Indicators?", pic: "pH-and-indicators.png", needSlider: false, content: SubContent(definition: "Indicators are chemicals which turn into different colours depending on the pH of the solution. \n\nThe transition range is the range in which the indicator changes from one colour to the other."), subTopics: [
            SubSubTopic(topic: "Methyl Orange", picture: "methyl-orange.png", id: 2, content: SubSubContent(image: "methyl-orange.png", firstAttributionText: "", secondAttributionText: "Colour Below Transition Range: Red \nTransition Range: pH 3.1 to pH 4.4 \nColour Above Transition Range: Yellow", thirdAttributionText: "Try out the interactive slider below:", lowpH: 3.1, highpH: 4.4, lowpHColor: "FF0000", middlepHColor: "FF7500", highpHColor: "FFE600", lowpHColorName: "Red", middlepHColorName: "Orange", highpHColorName: "Yellow", warningText: "⚠️ Only differentiates more acidic and less acidic substances")),
            SubSubTopic(topic: "Litmus", picture: "litmus-1.png", id: 1, content: SubSubContent(image: "litmus-1.png", firstAttributionText: "", secondAttributionText: "Colour Below Transition Range: Red \nTransition Range: pH 4.5 to pH 8.3 \nColour Above Transition Range: Blue", thirdAttributionText: "Try out the interactive slider below:", lowpH: 4.5, highpH: 8.3, lowpHColor: "F49191", middlepHColor: "B191F4", highpHColor: "479FF0", lowpHColorName: "Red", middlepHColorName: "Purple", highpHColorName: "Blue")),
            SubSubTopic(topic: "Phenolphthalein", picture: "phenolphthalein.png", id: 1, content: SubSubContent(image: "methyl-orange.png", firstAttributionText: "", secondAttributionText: "Colour Below Transition Range: Colourless \nTransition Range: pH 8.3 to pH 10.0 \nColour Above Transition Range: Pink", thirdAttributionText: "Try out the interactive slider below:", lowpH: 8.3, highpH: 10.0, lowpHColor: "E7F9F3", middlepHColor: "F486E0", highpHColor: "D352AE", lowpHColorName: "Colourless", middlepHColorName: "Light Pink", highpHColorName: "Pink", warningText: "⚠️ Only differentiates more alkaline and less alkaline substances")),
            SubSubTopic(topic: "Screened Methyl Orange (1)", picture: "screened-methyl-orange-1.png", id: 1, content: SubSubContent(image: "screened-methyl-orange-1.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 0.0, highpH: 3.2, lowpHColor: "FF6900", middlepHColor: "FF6900", highpHColor: "4b7b75", lowpHColorName: "Orange", middlepHColorName: "Orange", highpHColorName: "Grey")),
            SubSubTopic(topic: "Screened Methyl Orange (2)", picture: "screened-methyl-orange-2.png", id: 1, content: SubSubContent(image: "screened-methyl-orange-2.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 3.2, highpH: 4.4, lowpHColor: "4b7b75", middlepHColor: "4b7b75", highpHColor: "01A52F", lowpHColorName: "Grey", middlepHColorName: "Grey", highpHColorName: "Green")),
            SubSubTopic(topic: "Thymol Blue (1)", picture: "thymol-blue-1.png", id: 1, content: SubSubContent(image: "thymol-blue-1.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 1.2, highpH: 2.8, lowpHColor: "FF0000", middlepHColor: "FF7500", highpHColor: "FFE600", lowpHColorName: "Red", middlepHColorName: "Orange", highpHColorName: "Yellow")),
            SubSubTopic(topic: "Thymol Blue (2)", picture: "thymol-blue-2.png", id: 1, content: SubSubContent(image: "thymol-blue-2.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 8.0, highpH: 9.6, lowpHColor: "FFE600", middlepHColor: "01A52F", highpHColor: "274ED7", lowpHColorName: "Yellow", middlepHColorName: "Green", highpHColorName: "Blue")),
            SubSubTopic(topic: "Universal Indicator", picture: "universal-indicator-1.png", id: 1, content: SubSubContent(image: "universal-indicator-2.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "Try out the interactive slider below:", lowpH: 1, highpH: 1, lowpHColor: "", middlepHColor: "", highpHColor: "", lowpHColorName: "", middlepHColorName: "", highpHColorName: ""))
        ], navTitle: "Indicators"),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Take the Quiz")
    ], errorLabel: "Please complete Chapter 2"),

    Topic(title: "Periodic Table", pic: "periodic-table.png", pointsNeeded: 30, subTopics: [
        SubTopic(title: "What is the Periodic Table?", pic: "periodic-table.png", needSlider: false, content: SubContent(definition: "A periodic table is a chart that shows chemical elements in order of their atomic number. \n\nElements with similar properties are arranged in the same column (group), and elements with the same number of electron shells are arranged in the same row (period)."), subTopics: nil, navTitle: "Periodic Table"),
        SubTopic(title: "What are Elements?", pic: "element.png", needSlider: false, content: SubContent(definition: "An element is a pure substance that cannot be broken down by chemical means. \n\nEvery element is made up of its own type of atom. \n\nHere is an example of an element and how to read it in the periodic table:"), subTopics: nil, navTitle: "Elements"),
        SubTopic(title: "First 18 Elements", pic: "elements.png", needSlider: false, content: SubContent(definition: ""), subTopics: [
            SubSubTopic(topic: "1 - Hydrogen", picture: "pic.png", id: 1, content: SubSubContent(image: "pic.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 1 \nAtomic Mass: 1 \nMetallic Character: Unclassified", thirdAttributionText: "Found in: \n- Water (H₂O) \n- Air (H₂)")),
            SubSubTopic(topic: "2 - Helium", picture: "helium.png", id: 2, content: SubSubContent(image: "helium.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 2 \nAtomic Mass: 4.0 \nMetallic Character: Non-metal", thirdAttributionText: "Found in: \n- Certain Balloons (He₂)")),
            SubSubTopic(topic: "3 - Lithium", picture: "lithium.png", id: 3, content: SubSubContent(image: "lithium.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 3 \nAtomic Mass: 6.9 \nMetallic Character: Metal", thirdAttributionText: "Found in: \n- Extremely small quantities in plants")),
            SubSubTopic(topic: "4 - Beryllium", picture: "beryllium.png", id: 4, content: SubSubContent(image: "beryllium.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 4 \nAtomic Mass: 9.0 \nMetallic Character: Metal", thirdAttributionText: "Found in: \n- Beryl (Be₃Al₂SiO₆)")),
            SubSubTopic(topic: "5 - Boron", picture: "boron.png", id: 5, content: SubSubContent(image: "boron.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 5 \nAtomic Mass: 10.8 \nMetallic Character: Metalloid", thirdAttributionText: "Found in: \n- Not found naturally in pure forms")),
            SubSubTopic(topic: "6 - Carbon", picture: "carbon.png", id: 6, content: SubSubContent(image: "carbon.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 6 \nAtomic Mass: 12.0 \nMetallic Character: Non-metal", thirdAttributionText: "Found in: \n- Carbon Dioxide (CO₂)")),
            SubSubTopic(topic: "7 - Nitrogen", picture: "nitrogen.png", id: 7, content: SubSubContent(image: "nitrogen.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 7 \nAtomic Mass: 14.0 \nMetallic Character: Non-metal", thirdAttributionText: "Found in: \n- Laughing gas (N₂O)")),
            SubSubTopic(topic: "8 - Oxygen", picture: "oxygen.png", id: 8, content: SubSubContent(image: "oxygen.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 8 \nAtomic Mass: 16.0 \nMetallic Character: Non-metal", thirdAttributionText: "Found in: \n- Air(O2)")),
            SubSubTopic(topic: "9 - Fluorine", picture: "fluorine.png", id: 9, content: SubSubContent(image: "fluorine.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 9 \nAtomic Mass: 19.0 \nMetallic Character: Non-metal", thirdAttributionText: "Found in: \n- Toothpaste (C12H7Cl3FNaO2)")),
            SubSubTopic(topic: "10 - Neon", picture: "neon.png", id: 10, content: SubSubContent(image: "neon.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 10 \nAtomic Mass: 20.2 \nMetallic Character: Non-metal", thirdAttributionText: "Found in: \n- Neon lighting/signs(Ne)")),
            SubSubTopic(topic: "11 - Sodium", picture: "sodium.png", id: 11, content: SubSubContent(image: "sodium.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 11 \nAtomic Mass: 23.0 \nMetallic Character: Metal", thirdAttributionText: "Found in: \n- Table salt(NaCl)")),
            SubSubTopic(topic: "12 - Magnesium", picture: "magnesium.png", id: 12, content: SubSubContent(image: "magnesium.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 12 \nAtomic Mass: 24.3 \nMetallic Character: Metal", thirdAttributionText: "Found in: \n- Spinach, Potatoes(Mg)")),
            SubSubTopic(topic: "13 - Aluminium", picture: "aluminium.png", id: 13, content: SubSubContent(image: "aluminium.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 13 \nAtomic Mass: 27.0 \nMetallic Character: Metal", thirdAttributionText: "Found in: \n- Earth's crust")),
            SubSubTopic(topic: "14 - Silicon", picture: "silicon.png", id: 14, content: SubSubContent(image: "silicon.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 14 \nAtomic Mass: 28.1 \nMetallic Character: Metalloid", thirdAttributionText: "Found in: \n- sand (silicon)")),
            SubSubTopic(topic: "15 - Phosphorus", picture: "phosphorus.png", id: 15, content: SubSubContent(image: "phosphorus.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 15 \nAtomic Mass: 31.0 \nMetallic Character: Non-Metal", thirdAttributionText: "Found in: \n- Protein-rich foods")),
            SubSubTopic(topic: "16 - Sulfur", picture: "sulfur.png", id: 16, content: SubSubContent(image: "sulfur.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 16 \nAtomic Mass: 32.1 \nMetallic Character: Non-Metal", thirdAttributionText: "Found in: \n- Sulfuric Acid (H₂SO₄)")),
            SubSubTopic(topic: "17 - Chlorine", picture: "chlorine.png", id: 17, content: SubSubContent(image: "chlorine.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 17 \nAtomic Mass: 35.5 \nMetallic Character: Non-Metal", thirdAttributionText: "Found in: \n- Swimming pools(HC_l_ O)")),
            SubSubTopic(topic: "18 - Argon", picture: "argon.png", id: 18, content: SubSubContent(image: "argon.png", firstAttributionText: "", secondAttributionText: "Atomic Number: 18 \nAtomic Mass: 40.0 \nMetallic Character: Non-Metal", thirdAttributionText: "Found in: \n- Welding industry")),
        ], navTitle: "First 18 Elements"),
        SubTopic(title: "Groups' Properties", pic: "groups.png", needSlider: false, content: SubContent(definition: "The Periodic Table consists of 8 main groups, namely Groups 1, 2, 3, 4, 5, 6, 7, and 0. The respective groups' properties can be found by tapping below:"), subTopics: [
            SubSubTopic(topic: "Group 1", picture: "1.png", id: 1, content: SubSubContent(image: "1.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
            SubSubTopic(topic: "Group 2", picture: "2.png", id: 2, content: SubSubContent(image: "2.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
            SubSubTopic(topic: "Group 3", picture: "3.png", id: 3, content: SubSubContent(image: "3.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
            SubSubTopic(topic: "Group 4", picture: "4.png", id: 4, content: SubSubContent(image: "4.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
            SubSubTopic(topic: "Group 5", picture: "5.png", id: 5, content: SubSubContent(image: "5.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
            SubSubTopic(topic: "Group 6", picture: "6.png", id: 6, content: SubSubContent(image: "6.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
            SubSubTopic(topic: "Group 7", picture: "7.png", id: 7, content: SubSubContent(image: "7.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: "")),
            SubSubTopic(topic: "Group 0", picture: "0.png", id: 0, content: SubSubContent(image: "0.png", firstAttributionText: "", secondAttributionText: "", thirdAttributionText: ""))
        ], navTitle: "Groups' Properties"),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", needSlider: false, content: SubContent(definition: ""), subTopics: [], navTitle: "Take the Quiz")
    ], errorLabel: "Please complete Chapter 3"),
]

var gameTopics = [
    PlayTopic(title: "Find the Right Gas", pic: "gas-tests.png", pointsNeeded: 10, segDesti: "goToFindGas", errorLabel: "Please complete Chapter 1"),
    PlayTopic(title: "Retreive the Solids", pic: "separation-methods.png", pointsNeeded: 20, segDesti: "goToRetrieveSolids", errorLabel: "Please complete Chapter 2"),
    PlayTopic(title: "Adjust the pH", pic: "pH-and-indicators.png", pointsNeeded: 30, segDesti: "goToAdjustPh", errorLabel: "Please complete Chapter 3"),
    PlayTopic(title: "Identify the Elements", pic: "periodic-table.png", pointsNeeded: 40, segDesti: "goToIdentifyElement", errorLabel: "Please complete Chapter 4")
]

var gasTestsGameArray = [
    // LEVEL 1
    [GasTestGame(firstGasTank: "Hydrogen", secondGasTank: "Oxygen", thirdGasTank: "Carbon Dioxide", fourthGasTank: "Ammonia", correctGasTank: "Hydrogen"),],

    // LEVEL 2
    [GasTestGame(firstGasTank: "Hydrogen", secondGasTank: "Oxygen", thirdGasTank: "Carbon Dioxide", fourthGasTank: "Ammonia", correctGasTank: "Hydrogen"),],

    // LEVEL 3
    [GasTestGame(firstGasTank: "Hydrogen", secondGasTank: "Oxygen", thirdGasTank: "Carbon Dioxide", fourthGasTank: "Ammonia", correctGasTank: "Hydrogen"),]
]

var phGameArray = [
    // LEVEL 1
    [
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: false)
    ],

    //LEVEL 2
    [
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false)
    ],

    //LEVEL 3
    [
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true),
        PhGame(startIsAcidic: false),
        PhGame(startIsAcidic: true)
    ]
]

var phGameOptionsArray = [
    PhOption(name: "Stomach Acid", image: "ph-1.png", turnUniversalTankColour: "monster-ph1.png"),
    PhOption(name: "Lemonade", image: "ph-2.png", turnUniversalTankColour: "monster-ph2.png"),
    PhOption(name: "Apple Juice", image: "ph-3.png", turnUniversalTankColour: "monster-ph3.png"),
    PhOption(name: "Tomato Juice", image: "ph-4.png", turnUniversalTankColour: "monster-ph4.png"),
    PhOption(name: "Coffee", image: "ph-5.png", turnUniversalTankColour: "monster-ph5.png"),
    PhOption(name: "Milk", image: "ph-6.png", turnUniversalTankColour: "monster-ph6.png"),
    PhOption(name: "Egg", image: "ph-8.png", turnUniversalTankColour: "monster-ph8.png", isAcidic: false),
    PhOption(name: "Baking Soda", image: "ph-9.png", turnUniversalTankColour: "monster-ph9.png", isAcidic: false),
    PhOption(name: "Stomach Tablets", image: "ph-10.png", turnUniversalTankColour: "monster-ph10.png", isAcidic: false),
    PhOption(name: "Ammonia", image: "ph-11.png", turnUniversalTankColour: "monster-ph11.png", isAcidic: false),
    PhOption(name: "Soap", image: "ph-12.png", turnUniversalTankColour: "monster-ph12.png", isAcidic: false),
    PhOption(name: "Bleach", image: "ph-13.png", turnUniversalTankColour: "monster-ph13.png", isAcidic: false),
    PhOption(name: "Pipe Cleaner", image: "ph-14.png", turnUniversalTankColour: "monster-ph14.png", isAcidic: false),
]

var phGameAcidicUniversalStartColour = "monster-ph4.png"

var phGameAlkalinUniversalStartColour = "monster-ph10.png"

var perioicTable = [
    // LEVEL 1
    [
        periodicTableGame(properties: "Silver, reactive, high melting point and hard", correctAns1: 1, correctAns2: 1, timeGiven: 20),
        periodicTableGame(properties: "HALO", correctAns1: 1, correctAns2: 2, timeGiven: 20),
        periodicTableGame(properties: "bai", correctAns1: 1, correctAns2: 3, timeGiven: 20)
    ],
    // LEVEL 2
    [
        periodicTableGame(properties: "Silver, reactive, high melting point and hard", correctAns1: 1, correctAns2: 1, timeGiven: 15),
        periodicTableGame(properties: "HALO", correctAns1: 1, correctAns2: 2, timeGiven: 15),
        periodicTableGame(properties: "bai", correctAns1: 1, correctAns2: 3, timeGiven: 15)
    ],
    // LEVEL 3
    [
        periodicTableGame(properties: "Silver, reactive, high melting point and hard", correctAns1: 1, correctAns2: 1, timeGiven: 10),
        periodicTableGame(properties: "HALO", correctAns1: 1, correctAns2: 2, timeGiven: 10),
        periodicTableGame(properties: "bai", correctAns1: 1, correctAns2: 3, timeGiven: 10)
    ],
    // LEVEL 4
    [
        periodicTableGame(properties: "Silver, reactive, high melting point and hard", correctAns1: 1, correctAns2: 1, timeGiven: 5),
        periodicTableGame(properties: "HALO", correctAns1: 1, correctAns2: 2, timeGiven: 5),
        periodicTableGame(properties: "bai", correctAns1: 1, correctAns2: 3, timeGiven: 5)
    ]
]

var retrieveSolidsArray = [
    specificSeperationMethod(name: "aa", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "bbb", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "ccc", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "ddd", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "eee", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "ff", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "gg", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "hh", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "ii", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "jj", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "ff", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "gg", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "hh", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "ii", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)])),
    specificSeperationMethod(name: "jj", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),SeperationMethods(methodName: "Correct", isCorrect: true)]))
]

// MARK: - Functions

func changePoints(_ valueChanged: Int){
    points += valueChanged
    if (points < 0) {
        points = 0
    }
    let ud = UserDefaults.standard
    ud.set(points, forKey: "points")
}
