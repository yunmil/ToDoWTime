//
//  LoginView.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import SwiftUI


struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do with Time", subtitle: "Time to Start, Time to Finish", angle: 15, background: .yellow)
                
                //Login form
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.yellow)
                                .opacity(0.6)
                            
                            Text("Sign in")
                                .foregroundColor(Color.blue)
                                .bold()
                        }
                    }
                    .padding()
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
