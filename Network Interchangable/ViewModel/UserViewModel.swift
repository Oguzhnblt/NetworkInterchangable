//
//  UserViewModel.swift
//  Network Interchangable
//
//  Created by Oğuz on 16.08.2023.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    let webService = Webservice()
    
    func downloadUsers () async {
        do {
            let users = try await webService.download(Constants.URLs.userExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
    }
    
    
}




struct UserViewModel {
    
    let user: User
    
    var id: Int {
        user.id
    }
    
    var name: String {
        user.name
    }
    
    var username: String {
        user.username
    }
    
    var email: String {
        user.email
    }
}
