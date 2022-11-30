//
//  TabView.swift
//  FishApp
//
//  Created by Amit Garg on 01/08/22.
//

import SwiftUI


//struct TabedView : View {
//    
////    @StateObject var viewRouter: ViewRouter
//    
//    var body: some View {
//        NavigationView {
//            TabView {
//                HomeView()
//                    .tabItem {
//                        Image(systemName: "house")
//                            .font(.system(size: 22))
//                        Text("Home")
//                    }
//                
//                StatsView()
//                    .tabItem {
//                        Image(systemName: "chart.bar.fill")
//                            .font(.system(size: 22))
//                        Text("Status")
//                    }
//                ProfileView()
//                    .tabItem {
//                        Image(systemName: "person")
//                            .font(.system(size: 22))
//                        Text("Profile")
//                    }
//            }
//            .accentColor(.black)
//        }
//    }
//}

struct TabbarView : View {
    
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                
                    switch viewRouter.currentPage {
                    case .home:
                        HomeView()
                    case .stats:
                        StatsView()
                    case .profile:
                        ProfileView()
                    }
                   
                    VStack{
                        Spacer()
                        ZStack {
                            HStack {
                                Spacer()
                                TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/4, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                                Spacer()
                                TabBarIcon(viewRouter: viewRouter, assignedPage: .stats, width: geometry.size.width/4, height: geometry.size.height/28, systemIconName: "chart.bar.fill", tabName: "Status")
                                Spacer()
                                TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width/4, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Profile")
                                Spacer()
                            }
                            .frame(width: geometry.size.width - 40, height: 80)
                            .background(.white)
                            .padding(.horizontal, 0)
                        }
                        .background(.clear)
                        .cornerRadius(20)
                        .padding([.horizontal,.bottom], 20)
                        .shadow(color: .gray, radius: 4, x: -2, y: 1)
                    }
                    
                }
                .background(.gray)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        ZStack {
            HStack {
                ZStack {
                    if viewRouter.currentPage == assignedPage {
                        Circle()
                            .fill(Color("color_progress_bar_fill"))
                            .frame(width: 44, height: 44)
                    }
                    Image(systemName: systemIconName)
                        .resizable()
                        .frame(width: 21, height: 21)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                }
                if viewRouter.currentPage == assignedPage {
                    Text(tabName)
                    .font(.footnote)
                    .foregroundColor(.black)
                }
            }
            .frame(width: width, height: height)
            .padding(.all, 0)
        }
//            .padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
            .foregroundColor(viewRouter.currentPage == assignedPage ? Color.blue : .gray)
    }
}


class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}

enum Page {
    case home
    case stats
    case profile
}
