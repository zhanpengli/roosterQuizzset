//
//  RoosterGameView.swift
//  roosterQuizzset
//
//  Created by galen on 2024/8/18.
//

import SwiftUI
import AVFoundation

// 问题数据模型
struct Question {
    let text: String  // 问题内容
    let options: [String]  // 选项数组
    let correctAnswerIndex: Int  // 正确答案的索引
}

let VeryEasyQuestions: [Question] = [
    Question(text: "What is a baby chicken called?", options: ["Chick", "Poullet", "Pigeon", "Duckling"], correctAnswerIndex: 0),
    Question(text: "What do chickens use their comb for?", options: ["Temperature regulation", "Navigation", "Eating", "Flying"], correctAnswerIndex: 0),
    Question(text: "Which of these is a common habitat for chickens?", options: ["Forest", "Farmyard", "Desert", "Ocean"], correctAnswerIndex: 1),
    Question(text: "Chickens have which type of beak?", options: ["Curved", "Flat", "Pointed", "Hooked"], correctAnswerIndex: 0),
    Question(text: "Chickens are known for being:", options: ["Social", "Nocturnal", "Aggressive", "Solitary"], correctAnswerIndex: 0),
    Question(text: "How many toes does a chicken have on each foot?", options: ["Three", "Four", "Five", "Six"], correctAnswerIndex: 1),
    Question(text: "What is the purpose of a chicken's wattles?", options: ["Temperature regulation", "Communication", "Finding food", "Flight"], correctAnswerIndex: 0),
    Question(text: "Which of these foods do chickens typically avoid?", options: ["Corn", "Vegetables", "Meat", "Spices"], correctAnswerIndex: 3),
    Question(text: "How do chickens communicate with each other?", options: ["Singing", "Dancing", "Clucking", "Writing"], correctAnswerIndex: 2),
    Question(text: "Which of these is NOT a chicken breed?", options: ["Leghorn", "Rhode Island Red", "Plymouth Rock", "Norwegian Rat"], correctAnswerIndex: 3),
    Question(text: "What kind of animal is a chicken?", options: ["Bird", "Mammal", "Reptile", "Fish"], correctAnswerIndex: 0),
    Question(text: "How do chickens groom themselves?", options: ["Preening", "Scratching", "Bathing in dust", "All of the above"], correctAnswerIndex: 3),
    Question(text: "What do chickens use their beaks for?", options: ["Pecking", "Flying", "Swimming", "Digging"], correctAnswerIndex: 0),
    Question(text: "Which of these is a natural predator of the chicken in the wild?", options: ["Hawk", "Cat", "Snake", "All of the above"], correctAnswerIndex: 3),
    Question(text: "Chickens belong to which animal class?", options: ["Aves", "Mammalia", "Reptilia", "Amphibia"], correctAnswerIndex: 0)
]


let easyQuestions: [Question] = [
    Question(text: "What is the primary habitat of domesticated chickens?", options: ["Farmyard", "Deserts", "Rainforests", "Mountains"], correctAnswerIndex: 0),
    Question(text: "Which sense is weakest in chickens?", options: ["Sight", "Hearing", "Smell", "Taste"], correctAnswerIndex: 0),
    Question(text: "Chickens belong to which animal class?", options: ["Aves", "Mammalia", "Reptilia", "Amphibia"], correctAnswerIndex: 0),
    Question(text: "Which famous story features a character known as the 'Little Red Hen' who worked hard and baked bread?", options: ["The Little Red Hen", "Cinderella", "Snow White", "Hansel and Gretel"], correctAnswerIndex: 0),
    Question(text: "What color are most chickens found in a farmyard?", options: ["Black", "Brown", "White", "Gray"], correctAnswerIndex: 2),
    Question(text: "Chickens are part of which order of animals?", options: ["Carnivora", "Galliformes", "Lagomorpha", "Rodentia"], correctAnswerIndex: 1),
    Question(text: "What do chickens primarily use their wings for?", options: ["Flying", "Balance", "Navigation", "Warmth"], correctAnswerIndex: 1),
    Question(text: "Which type of chicken is also known for its egg-laying ability?", options: ["Rhode Island Red", "Leghorn", "Plymouth Rock", "Silkie"], correctAnswerIndex: 1),
    Question(text: "Chickens are most active during which time of day?", options: ["Day", "Morning", "Afternoon", "Night"], correctAnswerIndex: 1),
    Question(text: "Which part of a chicken's body helps it to balance?", options: ["Comb", "Wattle", "Tail", "Beak"], correctAnswerIndex: 2),
    Question(text: "Which chicken breed is known for being a common pet?", options: ["Leghorn", "Plymouth Rock", "Silkie", "Rhode Island Red"], correctAnswerIndex: 2),
    Question(text: "Chickens can carry diseases that affect humans. What is this type of disease called?", options: ["Genetic", "Autoimmune", "Bacterial", "Zoonotic"], correctAnswerIndex: 3),
    Question(text: "What is the main diet of a chicken?", options: ["Herbivorous", "Carnivorous", "Omnivorous", "Insectivorous"], correctAnswerIndex: 2),
    Question(text: "Which movie features a chicken trying to escape from a farm?", options: ["Chicken Run", "The Little Red Hen", "Hatchling", "The Farm"], correctAnswerIndex: 0),
    Question(text: "Chickens are known to be highly what?", options: ["Aggressive", "Social", "Slow", "Intelligent"], correctAnswerIndex: 1)
]

let mediumQuestions: [Question] = [
    Question(text: "What is the main reason chickens' feathers are so well adapted?", options: ["Insulation", "Flight", "Communication", "Defense"], correctAnswerIndex: 0),
    Question(text: "How many pairs of chromosomes do chickens have?", options: ["8", "10", "12", "14"], correctAnswerIndex: 1),
    Question(text: "Which chicken breed is known for its ability to lay a large number of eggs?", options: ["Leghorn", "Silkie", "Rhode Island Red", "Orpington"], correctAnswerIndex: 0),
    Question(text: "Chickens are primarily diurnal. What does this mean?", options: ["Active during the day", "Active during the night", "Active during twilight", "Active throughout the day and night"], correctAnswerIndex: 0),
    Question(text: "How many times can a chicken’s heart beat per minute on average?", options: ["250-300", "300-350", "350-400", "400-450"], correctAnswerIndex: 1),
    Question(text: "Which sense is most developed in chickens?", options: ["Sight", "Hearing", "Taste", "Touch"], correctAnswerIndex: 0),
    Question(text: "Chickens are known for their ability to forage. How long can they typically forage for?", options: ["1-2 hours", "2-4 hours", "4-6 hours", "6-8 hours"], correctAnswerIndex: 1),
    Question(text: "Which part of a chicken's brain is larger relative to its body size compared to other birds?", options: ["Olfactory bulb", "Cerebellum", "Cerebrum", "Hypothalamus"], correctAnswerIndex: 2),
    Question(text: "What is the typical size of a chicken's clutch?", options: ["6-8 eggs", "8-10 eggs", "10-12 eggs", "12-14 eggs"], correctAnswerIndex: 1),
    Question(text: "Chickens can squeeze through openings as small as:", options: ["The size of a quarter", "The size of a dime", "The size of a nickel", "The size of a half dollar"], correctAnswerIndex: 0),
    Question(text: "Chickens use their beaks for which purpose?", options: ["Pecking", "Temperature regulation", "Communication", "All of the above"], correctAnswerIndex: 3),
    Question(text: "Which type of chicken is often referred to as a 'layer'?", options: ["Leghorn", "Plymouth Rock", "Silkie", "Orpington"], correctAnswerIndex: 0),
    Question(text: "How do chickens communicate with each other?", options: ["Audible clucks", "Body language", "Feather displays", "All of the above"], correctAnswerIndex: 3),
    Question(text: "What type of diet do chickens have?", options: ["Herbivorous", "Carnivorous", "Omnivorous", "Insectivorous"], correctAnswerIndex: 2),
    Question(text: "What is the primary reason chickens are kept in farms?", options: ["Meat production", "Egg production", "Feather production", "All of the above"], correctAnswerIndex: 1)
]

let hardQuestions: [Question] = [
    Question(text: "What is the average lifespan of a domestic chicken?", options: ["5-7 years", "7-10 years", "10-12 years", "12-15 years"], correctAnswerIndex: 0),
    Question(text: "Which chicken breed is known as the most common commercial broiler?", options: ["Broiler", "Layer", "Rooster", "Silkie"], correctAnswerIndex: 0),
    Question(text: "Which part of a chicken's body continues to grow throughout its life?", options: ["Beak", "Feathers", "Legs", "Claws"], correctAnswerIndex: 1),
    Question(text: "In which year did the domestication of chickens begin?", options: ["3000 BCE", "2000 BCE", "1000 BCE", "500 BCE"], correctAnswerIndex: 0),
    Question(text: "What is the scientific name for the domestic chicken?", options: ["Gallus gallus", "Gallus domesticus", "Numida meleagris", "Alectoris chukar"], correctAnswerIndex: 1),
    Question(text: "Which chicken breed is most commonly used in scientific research?", options: ["Leghorn", "Rhode Island Red", "Plymouth Rock", "Silkie"], correctAnswerIndex: 0),
    Question(text: "How many eggs can a hen typically lay in a year?", options: ["200-250", "250-300", "300-350", "350-400"], correctAnswerIndex: 1),
    Question(text: "What is the average incubation period of a chicken egg?", options: ["18-21 days", "21-23 days", "23-25 days", "25-28 days"], correctAnswerIndex: 0),
    Question(text: "Chickens belong to which family?", options: ["Phasianidae", "Tetraonidae", "Odontophoridae", "Cracidae"], correctAnswerIndex: 0),
    Question(text: "Which ancient civilization considered chickens as sacred?", options: ["Egyptian", "Roman", "Chinese", "Greek"], correctAnswerIndex: 2),
    Question(text: "What is the term for a group of chickens?", options: ["Flock", "Swarm", "Pack", "Herd"], correctAnswerIndex: 0),
    Question(text: "Which continent is the domestic chicken originally native to?", options: ["Asia", "Africa", "Europe", "North America"], correctAnswerIndex: 0),
    Question(text: "Chickens have a poor sense of which of the following?", options: ["Hearing", "Smell", "Sight", "Taste"], correctAnswerIndex: 2),
    Question(text: "Which organ in chickens is particularly useful for scientific research due to its similarity to humans?", options: ["Liver", "Heart", "Kidney", "Brain"], correctAnswerIndex: 1),
    Question(text: "Which hormone is known to be produced in chickens and is often studied in relation to growth?", options: ["Adrenaline", "Cortisol", "Growth hormone", "Dopamine"], correctAnswerIndex: 2)
]

let veryHardQuestions: [Question] = [
    Question(text: "What is the chromosomal sex determination system used by chickens?", options: ["ZZ/ZW", "XY", "XX/XY", "XO/XO"], correctAnswerIndex: 0),
    Question(text: "Which chicken breed is known for its unique feathering that resembles hair?", options: ["Silkie", "Cochin", "Polish", "Campine"], correctAnswerIndex: 0),
    Question(text: "How many different types of color patterns can chickens have, according to genetic studies?", options: ["50", "100", "200", "300"], correctAnswerIndex: 2),
    Question(text: "Which gene is responsible for the 'blue' egg coloration in chickens?", options: ["Ovochrome", "Ovocyanin", "Ovolutein", "Ovolipid"], correctAnswerIndex: 1),
    Question(text: "What is the primary function of the 'bursa of Fabricius' in young chickens?", options: ["Immune system development", "Digestive enzyme production", "Feather growth", "Reproductive health"], correctAnswerIndex: 0),
    Question(text: "What is the approximate percentage of the chicken genome that has been sequenced and analyzed as of recent studies?", options: ["50%", "75%", "90%", "95%"], correctAnswerIndex: 3),
    Question(text: "Which hormone in chickens plays a crucial role in regulating egg production and is influenced by light exposure?", options: ["Melatonin", "Testosterone", "Estrogen", "Progesterone"], correctAnswerIndex: 2),
    Question(text: "What is the specific anatomical feature that allows chickens to perform a 'dust bath'?", options: ["Preen gland", "Uropygial gland", "Claws", "Feathers"], correctAnswerIndex: 1),
    Question(text: "What evolutionary adaptation allows chickens to be effective foragers and avoid predators?", options: ["Highly developed vision", "Strong talons", "Fast running speed", "Nocturnal habits"], correctAnswerIndex: 0),
    Question(text: "Which historical event led to the introduction of the chicken into European cuisine?", options: ["Roman conquests", "Medieval trade", "Viking explorations", "Crusades"], correctAnswerIndex: 1),
    Question(text: "What is the function of the chicken's 'syrinx'?", options: ["Voice production", "Digestion", "Temperature regulation", "Oxygen intake"], correctAnswerIndex: 0),
    Question(text: "Which breed of chicken is known for its unique ability to produce a variety of egg colors?", options: ["Araucana", "Barnevelder", "Houdan", "La Fleche"], correctAnswerIndex: 0),
    Question(text: "Which viral disease in chickens is characterized by severe respiratory symptoms and is often referred to as 'fowl plague'?", options: ["Avian influenza", "Newcastle disease", "Fowl pox", "Marek's disease"], correctAnswerIndex: 0),
    Question(text: "What is the name of the process by which chickens produce heat to maintain their body temperature?", options: ["Thermogenesis", "Thermolysis", "Heat dissipation", "Metabolic heat production"], correctAnswerIndex: 3),
    Question(text: "What historical document provides detailed information about the domestication and breeding of chickens in ancient civilizations?", options: ["The Domesday Book", "The Rosetta Stone", "The Iliad", "The Roman Agricultural Treatises"], correctAnswerIndex: 3)
]


// 游戏视图
struct RoosterGameView: View {
    @State private var questions: [Question] = []
    @State private var currentQuestionIndex: Int = 0
    @State private var right: Int = 0  // 正确回答的数量
    @State private var selectedOption: Int? = nil
    @State private var showNextButton: Bool = false
    @State private var showEndAlert: Bool = false
    @State private var correctOptionIndex: Int? = nil
    @State private var navigateToFinalView: Bool = false  // 控制导航到结果视图
    
    var isFrom: String = "VeryEasy"
    
    private let buttonHeight: CGFloat = 55
    private let cornerRadius: CGFloat = 50
    private let padding: CGFloat = 20
    
    var body: some View {
        ZStack {
            Image("rooster_bg")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Quiz")
                    .font(.system(size: 50, weight: .bold))
                    .padding(.bottom, 10)
                
                Text("Question \(currentQuestionIndex + 1)")
                    .font(.system(size: 30))
                
                Text(questions[safe: currentQuestionIndex]?.text ?? "")
                    .font(.system(size: 17))
                    .multilineTextAlignment(.center)
                    .padding(padding)
                    .frame(maxWidth: 400)
                
                VStack(spacing: 10) {
                    ForEach(0..<4, id: \.self) { index in
                        Button(action: {
                            optionButtonTapped(index)
                        }) {
                            Text(questions[safe: currentQuestionIndex]?.options[index] ?? "")
                                .frame(height: buttonHeight)
                                .frame(maxWidth: .infinity)
                                .background(buttonBackgroundColor(for: index))
                                .foregroundColor(.white)
                                .cornerRadius(cornerRadius)
                        }
                        .disabled(selectedOption != nil)
                    }
                }
                .padding(padding)
                .frame(width: 400)
                
                Button(action: {
                    nextQuestionButtonTapped()
                }) {
                    Text("Next Question")
                        .frame(height: buttonHeight)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                }
                .padding(padding)
                .opacity(showNextButton ? 1 : 0)
                .frame(width: 400)
            }
            .onAppear {
                loadQuestions()
                showQuestion()
            }
            .alert(isPresented: $showEndAlert) {
                Alert(
                    title: Text("Quiz Finished"),
                    message: Text("You have completed the quiz!"),
                    primaryButton: .default(Text("View Score"), action: {
                        navigateToFinalView = true
                    }),
                    secondaryButton: .cancel(Text("Restart"), action: restartQuiz)
                )
            }
            // 视图跳转
            .navigationDestination(isPresented: $navigateToFinalView) {
                RoosterFinalView(score: right)
            }
        }
    }
    
    func loadQuestions() {
        switch isFrom {
        case "VeryEasy":
            questions = VeryEasyQuestions
        case "Easy":
            questions = easyQuestions
        case "Medium":
            questions = mediumQuestions
        case "Hard":
            questions = hardQuestions
        case "Very Hard":
            questions = veryHardQuestions
        default:
            questions = VeryEasyQuestions
        }
    }
    
    func showQuestion() {
        selectedOption = nil
        correctOptionIndex = nil
        showNextButton = false
    }
    
    func optionButtonTapped(_ index: Int) {
        correctOptionIndex = questions[safe: currentQuestionIndex]?.correctAnswerIndex
        
        if index == correctOptionIndex {
            right += 1
        }
        
        selectedOption = index
        showNextButton = true
    }
    
    func nextQuestionButtonTapped() {
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            showQuestion()
        } else {
            showEndAlert = true
        }
    }
    
    func restartQuiz() {
        currentQuestionIndex = 0
        right = 0
        questions.shuffle()
        showQuestion()
    }
    
    func buttonBackgroundColor(for index: Int) -> Color {
        guard let selectedOption = selectedOption else {
            return Color.blue
        }
        
        if index == correctOptionIndex {
            return Color.green
        } else if index == selectedOption {
            return Color.red
        } else {
            return Color.blue
        }
    }
}


// 帮助扩展：安全数组索引
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


// 视图预览
struct RoosterGameView_Previews: PreviewProvider {
    static var previews: some View {
        RoosterGameView(isFrom: "Easy")
    }
}

