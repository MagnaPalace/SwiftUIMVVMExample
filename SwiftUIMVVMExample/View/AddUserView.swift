//
//  AddUserView.swift
//  SwiftUIMVVMExample
//
//  Created by Takeshi Kayahashi on 2025/03/13.
//

import SwiftUI

struct AddUserView: View {
    
    @State private var inputUserId: String = ""
    @State private var inputName: String = ""
    @State private var inputComment: String = ""
    
    @StateObject private var viewModel = AddUserViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("User ID")
                        .font(.headline)
                    TextField("", text: $inputUserId)
                        .modifier(TextFieldClearButton(text: $inputUserId))
                        .customTextFieldStyle()
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("名前")
                        .font(.headline)
                    TextField("", text: $inputName)
                        .modifier(TextFieldClearButton(text: $inputName))
                        .customTextFieldStyle()
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("コメント")
                        .font(.headline)
                    TextField("", text: $inputComment)
                        .modifier(TextFieldClearButton(text: $inputComment))
                        .customTextFieldStyle()
                }
                Button(action: {
                    viewModel.dismiss = { dismiss() }
                    viewModel.addUser(userId: inputUserId, name: inputName, comment: inputComment)
                }, label: {
                    Text("ユーザーを追加する")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .font(.system(size: 20))
                })
                .accentColor(.blue)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                Spacer()
            }
            .padding()
            .navigationTitle("ユーザー追加")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    AddUserView()
//}
