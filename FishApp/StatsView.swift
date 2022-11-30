//
//  StatsView.swift
//  FishApp
//
//  Created by Amit Garg on 01/08/22.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var image: String
    var point: Int
    var name: String
}

struct StatsView : View {
    
    let users = [
        User(image: "avatar3", point: 2200, name: "Dhaniram"),
        User(image: "avatar5", point: 1290, name: "Leena"),
        User(image: "avatar6", point: 1103, name: "Batman"),
        User(image: "avatar7", point: 980, name: "Charley"),
        User(image: "avatar8", point: 911, name: "Captain Tom"),
        User(image: "avatar9", point: 880, name: "Mariyam")]
    
    var body: some View {
//        NavigationView {
            ZStack {
                Color("color_background").ignoresSafeArea()
                VStack() {
                    HStack(alignment: .bottom, spacing: 50){
                        VStack(){
                            Text("2.")
                                .font(.largeTitle .weight(.bold))
                            Image("avatar4")
                                .aspectRatio(contentMode: .fill)
                                .overlay(
                                    Circle()
                                        .stroke(.blue, lineWidth: 4)
                                    )
                            Text("Sue")
                                .font(.title)
                            Text("6122")
                                .font(.largeTitle .weight(.bold))
                                .foregroundColor(.blue)
                        }
                        VStack(spacing: 5){
                            Text("1.")
                                .font(.largeTitle .weight(.bold))
                            Image("crown")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .aspectRatio(contentMode: .fit)
                            Image("avatar1")
                                .aspectRatio(contentMode: .fill)
                                .overlay(
                                    Circle()
                                        .stroke(.blue, lineWidth: 4)
                                    )
                            Text("Donald")
                                .font(.title)
                            Text("7204")
                                .font(.largeTitle .weight(.bold))
                                .foregroundColor(.blue)
                            Spacer()
                                .frame(height: 40)
                        }
                        VStack(){
                            Text("3.")
                                .font(.largeTitle .weight(.bold))
                            Image("avatar2")
                                .aspectRatio(contentMode: .fill)
                                .overlay(
                                    Circle()
                                        .stroke(.blue, lineWidth: 4)
                                    )
                            Text("Rambo")
                                .font(.title)
                            Text("6001")
                                .font(.largeTitle .weight(.bold))
                                .foregroundColor(.blue)
                        }
                    }
                    HStack {
                        Text("25.")
                            .padding(.leading, 15.0)
                        Text("Your current rank")
                            .font(.title2)
                            .frame(maxWidth: .infinity, maxHeight: 55, alignment: .leading)
                        Text("32")
                            .padding(.trailing, 15.0)
                            .font(.title2 .weight(.bold))
                    }
                    .background(Color("color_button"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 25.0)
                    
                    List(users.indices, id: \.self) { index in
                        let user = users[index]
                        UserCell(user: user, index: (index + 4))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10.0)
                    .listStyle(.plain)
                    .background(.clear)
                }
                .padding(.top, 20.0)
            }.navigationBarHidden(true)
//        }
    }
}

//struct StatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            StatsView()
//        }
//    }
//}


struct UserCell: View {
    var user: User
    var index: Int
    var body: some View {
        HStack {
            Text("\(index)")
            Image(user.image)
                .resizable()
                .frame(width: 44, height: 44)
            VStack {
                Text(user.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
            }
            Text("\(user.point)")
                .font(.title2 .weight(.bold))
        }
    }
}
