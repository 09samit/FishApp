//
//  QuizResultView.swift
//  FishApp
//
//  Created by Amit Garg on 04/08/22.
//

import SwiftUI

//struct RewindKey: EnvironmentKey {
//    static let defaultValue: Binding<Bool> = .constant(false)
//}
//
//extension EnvironmentValues {
//    var rewind: Binding<Bool> {
//        get { self[RewindKey.self] }
//        set { self[RewindKey.self] = newValue }
//    }
//}

struct QuizResultView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_background").ignoresSafeArea()
                
                VStack {
                    Image("sea")
                        .resizable()
                        .aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top, 10)
                    
                    HStack(spacing: 10) {
                        Text("Series Completed")
                            .font(Font.custom("PlusJakartaDisplay-Regular", size: 24))
                        Image(systemName: "checkmark")
                    }
                    .padding(.top, 12)
                    .padding(.bottom, 40)
                    
                    ZStack {
                        Circle()
                            .fill(Color("color_button"))
                            .frame(width: 140, height: 140)
                        
                        Group {
                            Text("8")
                            .font(Font.custom("PlusJakartaDisplay-Bold", size: 55)) +
                            Text("/10")
                                .font(Font.custom("PlusJakartaDisplay-Bold", size: 24))
                        }.foregroundColor(.white)
                    }
                    .padding(.bottom, 40)
                    
                    Text("You have finished the quiz, well done!")
                        .font(Font.custom("PlusJakartaDisplay-Regular", size: 18))
                    
                    
                    
                    
                    Spacer()
                    
                    Button(action: {}) {
                        HStack {
                            Text("Try Again")
                            Image(systemName: "gobackward")
                        }
                        .foregroundColor(.black)
                        .font(Font.custom("PlusJakartaDisplay-Regular", size: 18))
                    }
                    .padding(.bottom, 14)
                    
                    Button(action: {
                       
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 55)
                            .foregroundColor(Color("color_button"))
                            .overlay {
                                Text("Start a new series  >")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                    }.padding(.horizontal, 25)
                        .padding(.bottom, 10)
                }
                .padding(.horizontal, 25)
                
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView()
    }
}
