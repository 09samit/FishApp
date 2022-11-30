//
//  AnswerResultView.swift
//  FishApp
//
//  Created by Amit Garg on 04/08/22.
//

import SwiftUI

struct AnswerResultView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var isSuccess: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_background").ignoresSafeArea()
                
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "clear")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 15)
                    }
                    
                    VStack {
                        HStack {
                            Group {
                                Text("Question 7")
                                    .font(.title) +
                                Text("/10")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("SCORE: 6/10")
                                .foregroundColor(.gray)
                        }
                       
                        if isSuccess {
                            HStack {
                                Spacer()
                                ZStack {
                                    Circle()
                                        .fill(Color("color_button"))
                                    .frame(width: 40, height: 40)
                                    Text("+1")
                                        .foregroundColor(.white)
                                }
                            }.padding(.top, -15)
                        }
                        
                        Spacer()
                        Image(isSuccess ? "good_answer" : "bad_answer")
                        VStack(spacing: 10){
                            Text(isSuccess ? "This is Correct" : "Bad Answer")
                                .font(.largeTitle .weight(.bold))
                            Text(isSuccess ? "Well done!": "You will have a good answer\nwith the next question. We\nbelieve in you!")
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.01)
                        }
                        Spacer()
                        
                        
                        
                    }.padding(.horizontal, 25)
                        .padding(.top, 15)
                    
                    Spacer()
                    
                    HStack() {
                        Text("More infos")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("+")
                            .font(.title)
                        Spacer()
                    }.padding(.horizontal, 25)
                    
                    
                    NavigationLink {
                        QuizResultView()
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 55)
                            .foregroundColor(Color("color_button"))
                            .overlay {
                                Text("Next  >")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                    }.padding(.horizontal, 25)
                        .padding(.bottom, 10)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
//
//struct AnswerResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnswerResultView(isSuccess: true)
//    }
//}
