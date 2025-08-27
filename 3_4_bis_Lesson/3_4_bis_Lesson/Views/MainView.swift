//
//  Main.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        GeometryReader { geometry in
                    let topIndent = geometry.size.height / 6
        ZStack {
            Color.black.ignoresSafeArea()
                // Собственно вёрстка.
                VStack {
                    Text("Приветствую")
                        .titleTextStyle()
                        .padding(.top, topIndent)
                    Text(viewModel.firstName)
                        .titleTextStyle()
                        .padding(.top, 21)
                    Text(viewModel.lastName)
                        .titleTextStyle()
                        .padding(.top, 21)
                    Spacer()
                    Button {
                        viewModel.currentPage = .Authorisation
                    } label: {
                        Text("Выйти")
                    }
                    .commonButtonStyle()
                    .padding(.bottom, 102)
                }
                .padding(.horizontal, 30)
            }
        }
    }
}
