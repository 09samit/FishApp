//
//  ProfileView.swift
//  FishApp
//
//  Created by Amit Garg on 01/08/22.
//

import SwiftUI

struct Score: Identifiable {
    var id = UUID()
    var point: Int
    var date: String
}

struct ProfileView : View {
    
    let scores = [ Score(point: 20, date: "26/05/2022"),
                   Score(point: 42, date: "22/05/2022"),
                   Score(point: 19, date: "18/05/2022"),
                   Score(point: 04, date: "10/05/2022"),
                   Score(point: 10, date: "09/05/2022"),
                   Score(point: 31, date: "04/05/2022")]
    
    var body: some View {
//        NavigationView {
            ZStack {
                Color("color_background").ignoresSafeArea()
                
                VStack() {
                    Image("profile_pic")
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            Circle()
                                .stroke(.blue, lineWidth: 4)
                        )
                    .padding(.top, 20)
                    HStack(spacing: 15){
                        Text("John Doe")
                            .font(.largeTitle .weight(.bold))
                        Button(action: {
                            
                        }) {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 20)
                    
                    VStack {
                        Text("LAST SCORES:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                            .font(.footnote)
                        List(scores) { score in
                            HStack {
                                Text(score.date)
                                    .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(score.point)")
                                    .font(.title .weight(.bold))
                                    .foregroundColor(Color("color_button"))
                            }
                            .padding([.top, .bottom], 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, -15)
                            .listRowBackground(Color.clear)
                        }
                        .listStyle(.plain)
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 15)
                    
                    Spacer()
                    
                    HStack(spacing: 20){
                        Text("Total:")
                            .font(.title2)
                        Text("126")
                            .font(.title .weight(.bold))
                    }.padding(.bottom, 120)
                }
            }.navigationBarHidden(true)
//        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
        }
    }
}
