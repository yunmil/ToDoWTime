//
//  ProfileView.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                        .padding(.vertical, 20)
                    Image(systemName: "timelapse")
                        .font(.title)
                    
                }
                
            }
            .navigationTitle("Profile")
            
        }
        .onAppear() {
            viewModel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
        
        // Info: Name, Email, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack {
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
        }
        
        // Sign out
        Button("Sign out") {
            viewModel.logOut()
        }
        .tint(.blue)
        .padding(.vertical, 50)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
