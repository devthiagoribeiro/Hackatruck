//
//  ContentView.swift
//  aula03
//
//  Created by Turma01-26 on 19/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        ZStack(alignment: .center){
            Image("background").resizable().scaledToFill().blur(radius: 5.0).mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .clear]), startPoint: .bottom, endPoint: .top)).mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear]), startPoint: .top, endPoint: .bottom)).opacity(0.5)
            ZStack{
                VStack{
                    VStack(alignment: .center) {
                        Text("Seja bem vindo, \(name)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/ .bold())
                        TextField("Coloque seu nome", text: $name).font(.system(size: 20)).multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.top,50)
                    Image("bus").resizable().scaledToFit().frame(width: 400).padding(.bottom, 150).zIndex(1.0).shadow(radius: 10)
                    Button("Entrar") {
                        showingAlert = true
                    }.alert("Voce foi hackeado, faça um pix de 100 reais para mim", isPresented: $showingAlert) {
                        Button("fazer pix", role: .cancel) { }
                    }
                    .padding()
                }
            }
            
        }
    }
}
#Preview {
    ContentView()
}
