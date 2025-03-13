//
//  CustomTextFieldStyle.swift
//  SwiftUIMVVMExample
//
//  Created by Takeshi Kayahashi on 2025/03/13.
//

import SwiftUI

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 16)
            .font(.system(size: 20))
            .frame(height: 50)
            .background(Color(UIColor.quaternarySystemFill))
            .cornerRadius(10)
            .submitLabel(.done)
            .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 10.0, height: 10.0))
                    .stroke(Color.gray, lineWidth: 1.0)
            )
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .trailing)
        {
            content
            if !text.isEmpty {
                Button(
                    action: {
                        self.text = ""
                    })
                {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}

extension View {
    func customTextFieldStyle() -> some View {
        self.modifier(CustomTextFieldStyle())
    }
}
