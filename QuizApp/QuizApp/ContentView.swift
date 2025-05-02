//
//  ContentView.swift
//  QuizApp
//
//  Created by StudentPM on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView(){
            
            ZStack { //allows stacking backgound and content
                
                //sets background image
                Image("quiz")
                    .resizable() //make the image resizable to fit different screens
                    .scaledToFill() //Scale the image to fill the screen
                    .ignoresSafeArea()//fills entire screen
                
                //main vertical stack
                VStack{
                    //display this text in the screen
                    Text("Quiz Time!!")
                        .font(.system(size: 70))//set custom font size
                        .bold()//make text bold
                        .padding(.bottom,120)//add space below the score
                    
                    //create a button to go to quizView page
                    NavigationLink(destination: quizView()){
                        Text("Begin") //this is the text of the button
                            .frame(width: 190, height: 70)//this is the size of the button
                            .font(.system(size: 35))//set custom font size
                            .foregroundColor(.white)//set text color to white
                            .background(Color.purple) //make the background of the box purple.
                            .cornerRadius(10)//round the corners of the box
                            .padding(.top,90)// add space to the top of the text
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
