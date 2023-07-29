//
//  LoginView.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import SwiftUI


struct LoginView: View {
    //instance of our new class
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do with Time", subtitle: "Time to Start, Time to Finish", angle: 15, background: .yellow)
                
                
                //Login form
                Form {
                    //Error message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    //Login information
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TDTButtonView(
                        title: "Sign in",
                        background: .yellow,
                        foreground: .blue
                    ) {
                        //Action
                        viewModel.login()
                        
                        
                    }
                }
                .offset(y: -50)
                
                //New user
                VStack {
                    Text("New user?")
                    
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
