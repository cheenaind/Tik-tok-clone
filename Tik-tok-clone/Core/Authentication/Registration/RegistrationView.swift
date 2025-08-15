//
//  RegistrationView.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 14.08.25.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var userName: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("tiktok-color-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(CommonTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .textInputAutocapitalization(.never)
                    .modifier(CommonTextFieldModifier())
                
                TextField("Enter your full name", text: $fullName)
                    .textInputAutocapitalization(.never)
                    .modifier(CommonTextFieldModifier())
                
                TextField("Enter your username", text: $userName)
                    .textInputAutocapitalization(.never)
                    .modifier(CommonTextFieldModifier())
                
                Button {
                    
                } label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.vertical)
                .disabled(formIsValid)
                .opacity(!formIsValid ? 1 : 0.7)
                
                Spacer()
                
                Divider()
                
                Button {
                    dismiss()
                } label: {
                    Text("Already have an account")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                        .padding(.vertical)
                }
                
            }
        }.navigationBarBackButtonHidden()
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return [email.isEmpty, password.isEmpty, fullName.isEmpty, userName.isEmpty]
            .allSatisfy { $0 }
    }
}
#Preview {
    RegistrationView()
}
