//
//  ContentView.swift
//  FishApp
//
//  Created by Amit Garg on 26/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                                Button(action: {}) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 60)
                                        .foregroundColor(Color("color_button"))
                                        .overlay {
                                            Text("Let's start the quizz >")
                                                .foregroundColor(.white)
                                                .font(.title)
                                        }
                                }
                                Spacer()
                            }
                            .padding(.all)
                        }
                        ForEach(0..<10) {_ in
                            
                            HStack(spacing:15){
                                ZStack {
                                    Color(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Circle()
                                            .fill(Color("color_circle"))
                                            .frame(width: 50, height: 50)
                                        Text("Mediterranee")
                                            .font(.title2)
                                            .padding(.bottom, 3.0)
                                        Button(action: {}) {
                                            Text("Start the quizz >")
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.bottom)
                                    }.background(.white)
                                }
                                
                                ZStack {
                                    Color(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Circle()
                                            .fill(Color("color_circle"))
                                            .frame(width: 50, height: 50)
                                        Text("Mediterranee")
                                            .font(.title2)
                                            .padding(.bottom, 3.0)
                                        Button(action: {}) {
                                            Text("Start the quizz >")
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.bottom)
                                    }.background(.white)
                                }
                            }
                            .padding(.top, 10.0)
                        }
                    }.padding(.all)
                }
            }
            .navigationTitle("Hey John 👋🏼")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
