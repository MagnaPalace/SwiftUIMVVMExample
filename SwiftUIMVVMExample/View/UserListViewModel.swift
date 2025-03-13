//
//  UserListViewModel.swift
//  SwiftUIMVVMExample
//
//  Created by Takeshi Kayahashi on 2025/03/13.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    private let apiService: APIService
    
    @Published var users: [User] = []
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
        getAllUsers()
    }
    
    func getAllUsers() {
        apiService.fetch(completion: { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        })
    }
    
}
