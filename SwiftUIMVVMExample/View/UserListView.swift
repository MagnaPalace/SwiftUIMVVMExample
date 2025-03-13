//
//  UserListView.swift
//  SwiftUIMVVMExample
//
//  Created by Takeshi Kayahashi on 2025/03/13.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject private var viewModel = UserListViewModel()
    
    @State private var isAddUserView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    VStack(alignment: .leading){
                        Text(user.id.description)
                            .font(.headline)
                        Text(user.name)
                            .font(.subheadline)
                        Text(user.comment)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("SwiftUI MVVM Example")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isAddUserView = true
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                    }
                }
            }
            .sheet(isPresented: $isAddUserView, onDismiss: {
                viewModel.getAllUsers()
            }) {
                AddUserView()
                    .presentationDetents([.height(400), .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
