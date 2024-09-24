//
//  page2.swift
//  aula 06
//
//  Created by Turma01-27 on 24/09/24.
//

import SwiftUI

struct page2: View {
    @State var name: String = "teste"
    @State var artist: String = "teto"
    @State var capa: String = "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/5be0d999965737.5efe31136b12c.png"
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Spacer()
                VStack{
                    AsyncImage(url: URL(string: capa)){result in
                        result.image?
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 300)
                    Text(name)
                        .foregroundColor(.white)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text(artist)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack(spacing: 30){
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                }
                .foregroundColor(.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
        
        }
    }
}

#Preview {
    page2()
}
