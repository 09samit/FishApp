//
//  QuizeView.swift
//  FishApp
//
//  Created by Amit Garg on 04/08/22.
//

import SwiftUI

struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isSelected: Bool = false
}

struct QuizView: View {
    
    @Environment(\.dismiss) var dismiss

    @State var progressValue: Float = 0.7
    
    let answers = [Answer(text: "Sergeant Fish"),
                   Answer(text: "Dorish"),
                   Answer(text: "Star Fish"),
                   Answer(text: "Mermaid")]
        
    
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
                    VStack(spacing: 25) {
                        ZStack {
                            ProgressBar(value: $progressValue).frame(height: 50)
                            Text("7/10")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
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
                        
                        Image("sea")
                            .resizable()
                            .aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("What is the name of this fish?")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        List(answers) { answer in
                            AnswerView(answer: answer)
                        }
                        .listStyle(.plain)
                        .padding(.top, -10)
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 15)
                    
                    
                    NavigationLink {
                        let random = Int.random(in: 1..<3)
                        AnswerResultView(isSuccess: random == 2)
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 55)
                            .foregroundColor(Color("color_button"))
                            .overlay {
                                Text("Validate my answer")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                    }.padding(.horizontal, 25)
                        .padding(.bottom, 10)
                }
            }.navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView()
//    }
//}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.white)
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color("color_progress_bar_fill"))
                    .cornerRadius(45)
            }
            .cornerRadius(45.0)
            .overlay(
                RoundedRectangle(cornerRadius: 45)
                    .stroke(.gray, lineWidth: 2)
            )
            
        }
    }
}


struct AnswerView: View {
    
    @State var answer: Answer
    
    var body: some View {
        ZStack {
            HStack {
                Text(answer.text)
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .leading)
                    .padding(.leading, 15)
                Button(action: {
                    answer.isSelected = !answer.isSelected
                }) {
                    Image(answer.isSelected ? "check" : "un_check")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(.trailing, 15)
                        .foregroundColor(Color("color_circle"))
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 45)
                    .stroke(.gray, lineWidth:1)
            )
        }
        .padding(.horizontal, -15)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}
