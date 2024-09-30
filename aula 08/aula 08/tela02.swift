//
//  tela02.swift
//  aula 08
//
//  Created by Turma01-27 on 27/09/24.
//

import SwiftUI

struct tela02: View {
    @State var imagem = ""
    @State var name = "teste"
    @State var hairColour = "aaa"
    var body: some View {
        ZStack{
            Color.reds
            VStack(spacing: 10){
                AsyncImage(url: URL(string: imagem)){result in
                    result
                        .resizable()
                        .frame(width: 300, height: 300)
                    .clipShape(Circle())
                }placeholder: {
                    Circle()
                        .foregroundColor(.gray)
                }
                .frame(width:300)
                Text(name)
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text("Hair color: \(hairColour)")
                    .foregroundStyle(.white)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    tela02()
}
