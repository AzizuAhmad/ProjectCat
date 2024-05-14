//
//  Login.swift
//  ProjectCat
//
//  Created by MacBook Air on 07/05/24.
//

import SwiftUI

struct Login: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                GreetingandLogo()
        
                userPass(username: $username, password: $password)
                
                NavigationLink{
                    ContentView()
                        .navigationBarBackButtonHidden()
                }label: {
                    LoginText()
                }
                .disabled((username == "Admin" && password == "Admin") ? false : true)
                .padding(.top,40)
                .onTapGesture {
                    if username != "Admin" || password != "Admin" {
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("OK")))
                })
                
                
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
                
                VStack{
                    
                    TabLogin()
                }
                .padding(.bottom,-60)
                
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    Login()
}


struct GreetingandLogo: View {
    var body: some View {
        Text("Welcome to")
            .font(.system(size: 25,
                          weight: .ultraLight,
                          design: .default))
        Text("ToColor")
            .font(.system(size: 40,
                          weight: .heavy,
                          design: .default))
        
        Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: nil,height: 209)
            .padding(.top , -30)
            .padding(.bottom,40)
    }
}

struct userPass:View {
    
    @Binding var username: String
    @Binding var password: String
    
    var body: some View {
        HStack{
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34,height: 28)
                .padding()
            
            VStack{
                
                TextField("username",text: $username)
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
                
                SecureField("password",text: $password)
                Divider()
                    .frame(height: 1)
                    .overlay(.black)
            }
        }
        .padding(.leading,20)
        .padding(.trailing,40)
        
        
    }
}


struct LoginText:View {
    var body: some View {
        Text("Login")
            .font(.system(size: 20,weight: .semibold,
                design: .default))
            .foregroundStyle(.white)
            .frame(width: 314,height: 49)
            .background(Color("LoginColor"))
            .cornerRadius(10)
    }
}

struct TabLogin:View {
    var body: some View {
        Divider()
            .frame(height: 1)
            .overlay(.black)
        
        VStack{
            HStack{
                Text("Don`t have an account?")
                    .font(.system(size: 20,
                                  weight: .light))
                NavigationLink{
                    SignUp()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Sign Up")
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
