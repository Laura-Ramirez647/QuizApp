//
//  quizView.swift
//  QuizApp
//
//  Created by StudentPM on 4/28/25.
//

import SwiftUI

struct Question{
    var question: String //The question text
    var option:[String] //List of answer options
    var answer: String //The correct answer
}

struct quizView: View {
    
    //Array of sample questions, answer,and options
    @State private var questions:[Question]=[
        Question(question: "what is 80 * 30?", option: ["1.000","1.500","2.400","2.000"], answer: "2.400"),
        Question(question: "What is the largest mammal in the word?", option: ["Elephant","Blue Whale","Giraffe","Whale Shark"], answer: "Blue Whale"),
        Question(question: "What gas do plants absorb from the air?", option: ["Carbon Dioxide","Oxygen","Nitrogen","Helium"], answer: "Carbon Dioxide"),
        Question(question: "In what year did the Titanic sink?", option: ["1905","1918","1912","1920"], answer: "1912"),
        Question(question: "Which language is most spoken worldwide?", option: ["Spanish","Hindi","English","Arabic"], answer: "English"),
        Question(question: "What is the fastest land animal?", option: ["Lion","Horse","Gazelle","Cheetah"], answer: "Cheetah"),
        Question(question: "Which ocean is the largest?", option: ["Pacific","Atlantic","Indian","Arctic"], answer: "Pacific"),
        Question(question: "How many bones are in the human body?", option: ["201","206","212","198"], answer: "206"),
        Question(question: "What is the square root of 64?", option: ["6","8","7","10"], answer: "8"),
        Question(question: "What do bees collect and use to make honey?", option: ["Water","Pollen","Leaves","Nectar"], answer: "Nectar"),
        Question(question: "Which planet is closest to the Sun?", option: ["Mercury","Mars","Earth","Venus"], answer: "Mercury"),
        Question(question: "Which famous scientist developed the theory of gravity?", option: ["Albert Einstein","Galileo Galilei","Isaac Newton","Nikola Tesla"], answer: "Isaac Newton"),
        Question(question: "What is the hardest natural substance on Earth?", option: ["Gold","Steel","Iron","Diamond"], answer: "Diamond"),
        Question(question: "How many days are in a leap year?", option: ["366","360","365","364"], answer: "366"),
        Question(question: "Which part of the planet conducts photosynthesis?", option: ["Root","Stem","Leaf","Flower"], answer: "Leaf"),
        Question(question: "How many sides does a hexagon have?", option: ["6","8","5","9"], answer: "6"),
        Question(question: "What currency is used in Japan?", option: ["Won","Dollar","Peso","Yen"], answer: "Yen"),
        Question(question: "Which element has the chemical symbol O?", option: ["Oxygen","Gold","Osmium","Sodium"], answer: "Oxygen"),
        Question(question: "What type of animal is a Komodo dragon", option: ["Snake","Lizard","Dinosaur","Frog"], answer: "Lizard"),
        Question(question: "How many rings are on the Olympic flag?", option: ["4","7","5","6"], answer: "5")
    ]
    
    @State private var score: Int = 0 //keep track of player's score
    @State private var currentQuestionI: Int = 0 //Keep track of the current question number
    @State private var showResult: Bool = false //Controls when show the result screen
   
    var body: some View {
        
        NavigationView(){ //create a navigation view
            
            ZStack{ //allows stacking backgound and content
                
                Image("quiz2")//sets background image
                    .resizable() //make the image resizable to fit different screens
                    .scaledToFill() //Scale the image to fill the screen
                    .ignoresSafeArea() //fills entire screen
                
                //main vertical stack
                VStack{
                    
                    Text("Question \(currentQuestionI + 1)") //show current question number
                        .frame(width: 300, height: 50 , alignment: .leading) //align to the left and give a size to the space around text
                        .bold()//make text bold
                        .padding(.top, 25) // add space to the top of the text
                    
                    //show current score
                    Text("Score: \(score)")
                        .font(.system(size: 33)) //set custom font size
                        .bold()//make text bold
                        .padding(.bottom,10)//add space below the score
                
                    //check if there are still questions to ask
                    let question = questions[currentQuestionI]
                    
                    //Display the question text
                    Text(question.question)
                        .padding() // add padding
                        .frame(width: 350, height: 150)//size of the box
                        .background(Color.white)//sets the background color to white
                        .foregroundColor(.black) //set text color to black
                        .font(.system(size: 25))//set custom font size
                        .border(Color.purple, width: 4)//add a purple border around the box
                        .cornerRadius(8)//round the corners of the box
                    
                    //Display all the question options
                    ForEach(question.option, id: \.self){option in
                        
                        //create a button for the options
                        Button(action:{
                            
                            //if the option is equal to the answer
                            if option == question.answer{
                                
                                score += 1 //add to score if the answer is correct
                            }
                            
                            nextQuestion() //after the user chosee a option go to the fuction next question
                            
                        }){
                            Text(option) // the text of the button is the options of each question
                                .frame(maxWidth: 350, maxHeight: .infinity) // put width and height arround the text
                                .background(Color.white)//make the backgront of the box white
                                .foregroundColor(.black)// set text color to black
                                .border(Color.purple, width: 4)// put a purple border
                                .padding() //add padding inside the button
                        }
                    }
                    // if the current question number is equal to the last question
                    if currentQuestionI == 19{
                        
                        //create a link to go to the resultView page
                        NavigationLink(destination: resultView(score: score)){
                            
                            //text of the navigation link
                            Text("Next")
                                .frame(width: 120,height: 50) // size of the box
                                .font(.largeTitle)//make text larger
                                .border(Color.purple, width: 4)//add a purple border around the box
                                .background(Color.white)//sets the background color to white
                                .foregroundColor(.black)//set text color to black
                        }
                    }
                }
            }
        }
    }
    
    //a function to go to the next question.
    func nextQuestion(){
        
        //check if there are more questions before going to the next one. -1 for the app do not go to the index that does not exist.
        if currentQuestionI < questions.count - 1{
            
            currentQuestionI += 1 // add one to the currentQuestionI
        }
        
    }
}


#Preview {
    quizView()
}
