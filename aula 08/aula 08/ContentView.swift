//
//  ContentView.swift
//  aula 08
//
//  Created by Turma01-27 on 27/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.reds
                VStack{
                    VStack {
                        AsyncImage(url: URL(string: "https://tm.ibxk.com.br/2021/04/19/19134256944230.jpg?ims=704x264")){result in
                            result.image?
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width:700)
                        .opacity(0.35)
                    .background(Color.black)
                    }
                    ScrollView{
                        VStack (alignment: .leading){
                            ForEach(viewModel.chars){ index in
                                NavigationLink(destination: tela02(imagem: index.image!, name: index.name!, hairColour: index.hairColour!)){
                                        HStack(alignment: .center){
                                            AsyncImage(url: URL(string: index.image!)){result in
                                                result
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                            }placeholder: {
                                                Circle()
                                                    .foregroundColor(.gray)
                                            }
                                            .frame(height:100)
                                            Text(index.name!)
                                                .foregroundColor(.white)
                                                .bold()
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
            }
            .ignoresSafeArea()
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
}
#Preview {
    ContentView()
}
