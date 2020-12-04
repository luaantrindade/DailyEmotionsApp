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
    
    @State var color = Color.black.opacity(0.7)
    @State var  email = ""
    @State var pass = ""
    @State var visible = false
    /* @Binding var show : Bool
     @State var alert = false
     @State var error = ""*/
    
    var body: some View{
        
        VStack{
            
            Image("logo")
            Text("Log in to account")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.color)
                .padding(.top, 35)
            
            TextField("Email", text: self.$email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                .padding(.top, 25)
            
            HStack{
                
                VStack{
                    if self.visible{
                        TextField("Passoword", text: self.$pass)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                    }
                    else{
                        SecureField("Password", text: self.$pass)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                    }     
                }
                
                
                
            }
        }
        .padding(.horizontal, 25)
    }
}
