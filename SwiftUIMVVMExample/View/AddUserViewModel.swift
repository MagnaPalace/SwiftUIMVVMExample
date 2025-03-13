//
//  AddUserViewModel.swift
//  SwiftUIMVVMExample
//
//  Created by Takeshi Kayahashi on 2025/03/13.
//

import Foundation

class AddUserViewModel: ObservableObject {
    
    private let apiService: APIService
    
    var dismiss: (() -> Void)?
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func addUser(userId: String, name: String, comment: String) {
        apiService.add(userId: userId, name: name, comment: comment, completion: { result in
            switch result {
            case .success(let user):
                print("success \(user)")
                self.dismiss?()
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        })
    }
}
