//
//  ContentView.swift
//  aula 04
//
//  Created by Turma01-27 on 20/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var peso:Double = 0.0
    @State private var altura:Double = 0.0
    @State private var buttonBackColor:Color = .white
    @State private var status:String = ""
    @State var imc:Double = 0
    
    var body: some View {
        
        ZStack{
            buttonBackColor
                .ignoresSafeArea()
            VStack{
                HStack {
                    Image("sigma")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Text("Imc\nCalculator")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                }
                .padding(.top, 20)
                VStack{
                    TextField("coloque seu peso", value: $peso, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .padding()
                        .frame(width: 300)
                        .background(.gray.opacity(0.4))
                        .cornerRadius(10)
                        .padding(.bottom,5)
                        .padding(.top,4)
                    TextField("coloque sua altura", value: $altura, format: .number)
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .padding()
                        .frame(width: 300)
                        .background(.gray.opacity(0.4))
                        .cornerRadius(10)
                    Button("Calcular") {
                        buttonTapped()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .padding(.top, 10)
                    .controlSize(.large)
                }
                Spacer()
                Text(status)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Image("tabela")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom,-40)
            }
        }
    }
    func buttonTapped() {
        imc = peso/(altura*altura)
        if imc < 18.5{
            status = "Baixo peso"
            buttonBackColor = .bp
        }else if imc > 18.5 && imc < 24.99{
            status = "Normal"
            buttonBackColor = .normal
        }else if imc > 24.99 && imc < 29.99{
            status = "Sobrepeso"
            buttonBackColor = .sobrepeso
        }else if imc > 30.0{
            status = "Obesidade"
            buttonBackColor = .obesidade
        }
      }
}

#Preview {
    ContentView()
}
