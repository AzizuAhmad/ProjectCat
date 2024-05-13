//
//  SignUp.swift
//  ProjectCat
//
//  Created by MacBook Air on 08/05/24.
//

import SwiftUI

struct SignUp: View {
    
    @State var usernameReg: String = ""
    @State var passwordReg: String = ""
    @State var confirmPass: String = ""
    @State var isChecked: Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                VStack{
                    Text("Hello there,")
                        .font(.system(size: 25,weight: .ultraLight,design: .default))
                    Text("Create an Account")
                        .font(.system(size: 25, weight: .bold,design: .default))
                }
                .padding(.top,100)
                .padding(.bottom,60)
                
                userPassReg(usernameReg: $usernameReg, passwordReg: $passwordReg, confirmPass: $confirmPass)
                
                
                HStack{
                    Toggle(isOn: $isChecked) {
                        Text("By signing up, you agree to Photo’s Terms of Service and Privacy Policy.")
                            .font(.system(size: 11,weight: .regular,design: .default))
                    }
                    .toggleStyle(CheckboxToggleStyle())
                }
                .frame(height: 30)
                .padding(.horizontal,30)
                .padding()
//                .border(Color.black)
                
                NavigationLink{
                    Login()
                        .navigationBarBackButtonHidden()
                }label: {
                    RegisText()
                }
                .padding(.top,40)
                
                HStack{
                    Spacer()
                    VStack{
                        Divider()
                            .frame(width: 138)
                            .overlay(.black)
                    }
                    Text("or")
                        .font(.system(size: 20,
                                      weight: .regular,
                                      design: .default))
                    VStack{
                        Divider()
                            .frame(width: 138)
                            .overlay(.black)
                    }
                    Spacer()
                }
                .padding(.top,7)
                
                Image(systemName: "apple.logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:27)
                
                Spacer()
                    .frame(height: 50)
//                    .padding(.bottom,-100)

                
                VStack{
                    TabRegister()
                }
                .padding(.bottom,-60)

                
                Spacer()
            }
        }
        
    }
}

#Preview {
    SignUp()
}


struct userPassReg:View {
    
    @Binding var usernameReg: String
    @Binding var passwordReg: String
    @Binding var confirmPass: String
    
    var body: some View {
        HStack{
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34,height: 28)
                .padding()
            
            VStack{
                
                TextField("Username",text: $usernameReg)
                Divider()
                    .frame(height: 1)
                    .overlay(.black)
            }
        }
        .padding(.leading,20)
        .padding(.trailing,40)

        
        HStack{
            Image(systemName: "lock")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34,height: 28)
                .padding()
            
            VStack{
                
                TextField("Password",text: $passwordReg)
                Divider()
                    .frame(height: 1)
                    .overlay(.black)
            }
        }
        .padding(.leading,20)
        .padding(.trailing,40)
        
        HStack{
            Image(systemName: "lock")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34,height: 28)
                .padding()
            
            VStack{
                
                TextField("Confirmation Password",text: $confirmPass)
                Divider()
                    .frame(height: 1)
                    .overlay(.black)
            }
        }
        .padding(.leading,20)
        .padding(.trailing,40)
        
    }
}


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
 
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
 
            configuration.label
 
        }
    }
}


struct RegisText:View {
    var body: some View {
        Text("Register")
            .font(.system(size: 20,weight: .semibold,
                design: .default))
            .foregroundStyle(.white)
            .frame(width: 314,height: 49)
            .background(Color("LoginColor"))
            .cornerRadius(10)
    }
}


struct TabRegister:View {
    var body: some View {
        Divider()
            .frame(height: 1)
            .overlay(.black)
        
        VStack{
            HStack{
                Text("Already have an account?")
                    .font(.system(size: 20,
                                  weight: .light))
                NavigationLink{
                    Login()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Login")
                        .font(.system(size: 20,
                                      weight: .heavy,
                                      design: .default))
                        .foregroundStyle(Color("LoginColor"))
                }
            }
            .padding()
        }

    }
}
