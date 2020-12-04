//
//  ContentView.swift
//  DailyEmotionsApp
//
//  Created by Jeff on 03/12/2020.
//  Copyright © 2020 Jeff Inc. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        
        Home()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    
    var body: some View{
        
        VStack{
            Login()
            
        }
        
    }
}

struct Login: View {
    //teste
    @State var color = Color.black.opacity(0.7)
    @State var  email = ""
    @State var pass = ""
    @State var visible = false
    /* @Binding var show : Bool
     @State var alert = false
     @State var error = ""*/
    
    var body: some View{
        
        VStack{
            //Login fields
            Image("logo")
            Text("Log in to account")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.color)
                .padding(.top, 35)
            
            //Email Field
            TextField("Email", text: self.$email)
                .padding()
                .autocapitalization(.none)
                .background(RoundedRectangle(cornerRadius: 20).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                .padding(.top, 25)
            
            //Passoword Field
            HStack(spacing: 15){
                
                VStack{
                    
                    if self.visible{
                        
                        TextField("Password", text: self.$pass)
                            //Do not permit start the password with the first letter capitalizated.
                            .autocapitalization(.none)
                    }
                    else{
                        
                        SecureField("Password", text: self.$pass)
                            //Do not permit start the password with the first letter capitalizated.
                            .autocapitalization(.none)
                    }
                }
                
                Button(action: {
                    
                    self.visible.toggle()
                    
                }) {
                    
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                }
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
            .padding(.top, 25)
            
            //Forget Password
            HStack{
                Button(action: {
                    
                }){
                    Spacer()
                    Text("Forget password?")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                        .padding(.top, 15)
                }
            }
            
        }
        .padding(.horizontal, 25)
    }
}
