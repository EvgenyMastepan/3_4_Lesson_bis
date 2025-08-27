//
//  RegistrationView.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let topIndent = geometry.size.height / 6
            
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Text("Регистрация")
                            .titleTextStyle()
                            .padding(.top, topIndent)
                        
                        TextField("Email", text: $viewModel.email)
                            .commonTextFieldStyle()
                            .textContentType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.top, 20)
                        
                        SecureField("Пароль", text: $viewModel.password)
                            .commonTextFieldStyle()
                            .textContentType(.newPassword)
                            .padding(.top, 20)
                        
                        TextField("Имя", text: $viewModel.firstName)
                            .commonTextFieldStyle()
                            .textContentType(.givenName)
                            .padding(.top, 20)
                        
                        TextField("Фамилия", text: $viewModel.lastName)
                            .commonTextFieldStyle()
                            .textContentType(.familyName)
                            .padding(.top, 20)
                        
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .padding(.top, 10)
                        }
                        
                        Button {
                            viewModel.register { success in
                                if success {
                                    let user = User(
                                        email: viewModel.email,
                                        password: viewModel.password,
                                        firstName: viewModel.firstName,
                                        lastName: viewModel.lastName
                                    )
                                    appViewModel.setUser(user)
                                    appViewModel.navigateToMain()
                                }
                            }
                        } label: {
                            Text("Зарегистрироваться")
                        }
                        .commonButtonStyle()
                        .padding(.top, 48)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                }
            }
        }
    }
}
