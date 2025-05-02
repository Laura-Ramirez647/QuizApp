//
//  resultView.swift
//  QuizApp
//
//  Created by StudentPM on 4/30/25.
//

import SwiftUI
    
    
struct resultView: View {
    
    //store the score here
    var score: Int
    
    var body: some View {
    
        NavigationView(){
            
            ZStack{//allows stacking backgound and content
                
                //sets background image
                Image("quiz2")
                    .resizable() //make the image resizable to fit different screens
                    .scaledToFill()//Scale the image to fill the screen
                    .ignoresSafeArea()//fills entire screen
               
                //main vertical stack
                VStack{
                    
                    //display this text
                    Text("Quiz Completed!")
                        .font(.system(size: 40))//set custom font size
                        .bold()//make text bold
                        .padding() //add space all around the text
                    
                    //Display the text and the score of the player.
                    Text("Your score is \(score)/20")
                        .font(.system(size: 20))//set custom font size
                        .bold()//make text bold
                    
                    NavigationLink(destination: ContentView()){
                        Text("Play again")
                            .frame(width: 190, height: 70)
                            .font(.system(size: 35))//set custom font size
                            .foregroundColor(.white)//set text color to white
                            .background(Color.purple)//sets the background color to purple
                            .cornerRadius(10)//round the corners of the box
                            .padding(.top,190)// add space to the top of the text
                    }
                }
            }
        }
    }
}

#Preview {
    resultView(score: 0)//bring the score to this page
}
