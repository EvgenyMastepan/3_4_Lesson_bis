//
//  Main.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let topIndent = geometry.size.height / 6
            
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Text("Приветствую")
                        .titleTextStyle()
                        .padding(.top, topIndent)
                    
                    if let user = appViewModel.currentUser {
                        Text(user.firstName)
                            .titleTextStyle()
                            .padding(.top, 21)
                        
                        Text(user.lastName)
                            .titleTextStyle()
                            .padding(.top, 21)
                    }
                    
                    Spacer()
                    
                    Button {
                        appViewModel.clearUser()
                        appViewModel.navigateToAuthorization()
                    } label: {
                        Text("Выйти")
                    }
                    .commonButtonStyle()
                    .padding(.bottom, 102)
                }
                .padding(.horizontal, 30)
            }
        }
        .onAppear {
            if appViewModel.currentUser == nil {
                viewModel.loadUserData()
            }
        }
    }
}
