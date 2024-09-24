//
//  ContentView.swift
//  aula 06
//
//  Created by Turma01-27 on 24/09/24.
//

struct song: Hashable{
    var name: String
    var artist: String
    var capa: String
}

var musicas = [
    song(name: "333", artist: "Matue", capa: "https://images.genius.com/5286e0db639a7ff8a6d2366b121b8784.633x633x1.png"),
    song(name: "Maria", artist: "Matue", capa: "https://images.genius.com/5286e0db639a7ff8a6d2366b121b8784.633x633x1.png"),
    song(name: "1993", artist: "Matue", capa: "https://images.genius.com/5286e0db639a7ff8a6d2366b121b8784.633x633x1.png"),
    song(name: "4tal", artist: "Matue", capa: "https://images.genius.com/5286e0db639a7ff8a6d2366b121b8784.633x633x1.png"),
    song(name: "Crack com Mussilon", artist: "Matue", capa: "https://images.genius.com/5286e0db639a7ff8a6d2366b121b8784.633x633x1.png"),
    song(name: "Isso é sério", artist: "Matue", capa: "https://images.genius.com/5286e0db639a7ff8a6d2366b121b8784.633x633x1.png"),
    song(name: "O Som", artist: "Matue", capa: "https://images.genius.com/5286e0db639a7ff8a6d2366b121b8784.633x633x1.png")
]

var sugestoes = [
    song(name: "Vivaz", artist: "Filipe Ret", capa: "https://i.scdn.co/image/ab67616d0000b273ea014fe369f55928b7d16f4a"),
    song(name: "Chefe do crime perfeito", artist: "Filipe Ret", capa: "https://akamai.sscdn.co/letras/360x360/albuns/8/8/a/f/1068851619196025.jpg"),
    song(name: "Libertarios não morrem", artist: "Filipe Ret", capa: "https://akamai.sscdn.co/letras/360x360/albuns/e/9/b/1/1047941616175829.jpg")
]

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    ScrollView(.vertical){
                        AsyncImage(url: URL(string: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/5be0d999965737.5efe31136b12c.png")){result in
                            result.image?
                                .resizable()
                                .scaledToFill()
                        }
                        .frame(width:250)
                        .padding(.top, 20)
                        .padding(.bottom, 50)
                        HStack{
                            Text("Th's palylist")
                                .frame(width: .infinity)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Spacer()
                        }
                        .padding(.leading, 30)
                        
                        ForEach(musicas, id: \.self) { musica in
                            NavigationLink(destination: page2(name: musica.name, artist: musica.artist, capa: musica.capa)){
                                HStack{
                                    AsyncImage(url: URL(string: musica.capa)){result in
                                        result.image?
                                            .resizable()
                                            .scaledToFill()
                                    }
                                    .frame(width:70)
                                    VStack(alignment: .leading){
                                        Text(musica.name)
                                            .foregroundColor(.white)
                                            .bold()
                                            .padding(.bottom, 1)
                                        Text(musica.artist)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Button(action: {}, label: {
                                        Image(systemName: "ellipsis")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 15)
                                    })
                                    .foregroundStyle(.white)
                                    .padding(.trailing, 30)
                                }
                                .padding(.leading, 20)
                                .padding(.top, 3)
                            }
                        }
                        HStack(){
                            Text("Sugeridos")
                                .bold()
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 30)
                                .padding(.top,30)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            HStack(spacing: 30){
                                ForEach(sugestoes, id: \.self) { ref in
                                    NavigationLink(destination: page2(name: ref.name, artist: ref.artist, capa: ref.capa)){
                                        VStack{
                                        AsyncImage(url: URL(string: ref.capa)){result in
                                            result.image?
                                                .resizable()
                                                .scaledToFill()
                                        }
                                        .frame(width:200)
                                        .padding(.top, 20)
                                        Text(ref.name)
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(.top, 10)
                                        Text(ref.artist)
                                            .foregroundColor(.gray)
                                    }
                                    }
                                }
                            }
                            .padding(.leading,30)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
