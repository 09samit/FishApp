//
//  HomeView.swift
//  FishApp
//
//  Created by Amit Garg on 01/08/22.
//

import SwiftUI

struct HomeView: View {
    
    let columns = [
        GridItem(.flexible(minimum: 40), spacing: 20),
        GridItem(.flexible(minimum: 40), spacing: 20)
    ]
    
    struct Quize: Identifiable {
        let id: UUID
        var title: String
    }
    
    let quizes: [Quize] = [
        Quize(id: UUID(), title: "Mediterranee"),
        Quize(id: UUID(), title: "Atlantique"),
        Quize(id: UUID(), title: "Faune"),
        Quize(id: UUID(), title: "Flore")
    ]
    
    var body: some View {
//        NavigationView {
            ZStack {
                Color("color_background").ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack {
                        ZStack {
                            Color(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            VStack(alignment: .leading) {
                                    Text("Have fun with our quizzes")
                                        .font(.title .weight(.bold))
                                        .padding(.horizontal)
                                    Image("sea")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 20))
                                Spacer()
                                Spacer()
                                Spacer()
                                NavigationLink {
                                    QuizView()
                                } label: {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 55)
                                        .foregroundColor(Color("color_button"))
                                        .overlay {
                                            Text("Let's start the quizz    >")
                                                .foregroundColor(.black)
                                                .font(.title2)
                                        }
                                }
                                Spacer()
                            }
                            .padding(.all)
                        }
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            
                            ForEach(quizes) { quize in
                                ZStack {
                                    Color(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Circle()
                                            .fill(Color("color_circle"))
                                            .frame(width: 50, height: 50)
                                        Text(quize.title)
                                            .font(.title2)
                                            .padding(.bottom, 3.0)
                                        NavigationLink {
                                            QuizView()
                                        } label: {
                                            Text("Start the quizz >")
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.bottom)
                                    }.background(.white)
                                }
                            }
                        }
                        .padding(.vertical, 10.0)
                    }
                    .padding(.all)
                    .padding(.horizontal, 5.0)
                    
                    Spacer()
                    .padding(.bottom, 90)
                }
            }
            .navigationTitle("Hey John 👋🏼")
//        }
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            HomeView()
//        }
//    }
//}
