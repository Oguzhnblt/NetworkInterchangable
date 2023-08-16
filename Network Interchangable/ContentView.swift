//
//  ContentView.swift
//  Network Interchangable
//
//  Created by Oğuz on 16.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel: UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: Localservice())
    }
    
    var body: some View {
        List(userListViewModel.userList,id: \.id) { user in
            VStack {
                Text(user.name).frame(maxWidth:.infinity, alignment: .leading).font(.title3).foregroundColor(.accentColor)
                Text(user.username).frame(maxWidth:.infinity, alignment: .leading)
                Text(user.email).frame(maxWidth:.infinity, alignment: .leading).foregroundColor(.green)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
