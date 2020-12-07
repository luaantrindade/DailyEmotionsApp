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
    
    @State var show = false
    @State var appeared: Double = 0.0
    
    var body: some View{
        
        NavigationView{
            ZStack{
                
                NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                Login(show: self.$show)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            
        }
        .opacity(appeared)
        .animation(Animation.easeInOut(duration: 1.0), value: appeared)
        .onAppear {self.appeared = 1.0}
        .onDisappear {self.appeared = 0.0}
        
        
    }
}

struct Login: View {
    //teste
    @State var color = Color.black.opacity(0.7)
    @State var  email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    /*
     @State var alert = false
     @State var error = ""*/
    
    var body: some View{
        
        ZStack(alignment: .topTrailing){
            
            GeometryReader{_ in
                
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
                                .padding(.bottom)
                        }
                    }
                    
                    //Log in Button
                    HStack{
                        Button(action:{
                            
                            
                        }){
                            
                            Text("Log in")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                            
                        }
                        .background(Color("Color"))
                        .cornerRadius(20)
                        .padding(.top,25)
                    }
                    
                }
                .padding(.horizontal, 25)
            }
            Button(action: {
                
                self.show.toggle()
                
            }) {
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
        
        
    }
    
    
}

struct SignUp: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var  email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    /* @State var alert = false
     @State var error = ""*/
    
    var body: some View{
        
        ZStack(alignment: .topLeading){
            
            GeometryReader{_ in
                
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
                    
                    //Re-enter pass Field
                    HStack(spacing: 15){
                        
                        VStack{
                            
                            if self.revisible{
                                
                                TextField("Re-enter password", text: self.$repass)
                                    //Do not permit start the password with the first letter capitalizated.
                                    .autocapitalization(.none)
                            }
                            else{
                                
                                SecureField("Re-enter password", text: self.$repass)
                                    //Do not permit start the password with the first letter capitalizated.
                                    .autocapitalization(.none)
                            }
                        }
                        
                        Button(action: {
                            
                            self.revisible.toggle()
                            
                        }) {
                            
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(self.repass != "" ? Color("Color") : self.color,lineWidth: 2))
                    .padding(.top, 25)
                    
                    
                    //Register Button
                    HStack{
                        Button(action:{
                            
                            
                        }){
                            
                            Text("Register")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(20)
                        .padding(.top,25)
                    }
                    
                    
                    //Register Button
                    /* HStack(){
                     
                     Button(action:{
                     
                     
                     }){
                     
                     Text("Register")
                     .foregroundColor(.white)
                     .padding(.vertical)
                     .frame(width: UIScreen.main.bounds.width - 50)
                     }
                     .background(Color("Color"))
                     .cornerRadius(20)
                     .padding(.top,25)
                     }
                     */
                    
                }
                .padding(.horizontal, 25)
            }
            Button(action: {
                self.show.toggle()
            }) {
                Image(systemName:"chevron.left")
                    .font(.title)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    
}

