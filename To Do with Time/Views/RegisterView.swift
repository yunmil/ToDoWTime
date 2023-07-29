//
//  RegisterView.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subtitle: "Own Your Time", angle: -15, background: .yellow)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TDTButtonView(
                    title: "Create account",
                    background: .yellow,
                    foreground: .blue
                ) { //Action
                    //Attempt registration
                    viewModel.register()
                    }
                //.padding()
            }
            .offset(y: -50)
            
            
            Spacer()
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
