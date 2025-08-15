//
//  LoginView.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 14.08.25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
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
                }
                
                NavigationLink {
                    Text("Forget Password")
                } label: {
                    Text("Forget Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
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
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.7)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStackLayout(spacing: 3) {
                        Text("Dont't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }.font(.footnote)
                        .padding(.vertical)
                }
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && !password.isEmpty
    }
}
#Preview {
    LoginView()
}
