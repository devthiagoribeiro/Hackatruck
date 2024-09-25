//
//  SwiftUIView.swift
//  aula 07
//
//  Created by Turma01-27 on 25/09/24.
//

import SwiftUI
import MapKit
import Foundation

struct flag: Identifiable{
    let id = UUID()
    var name: String
    var icon: String
    var latitude: Float
    var longitude: Float
}

var flags = [
    flag(name: "Brazil", icon: "https://www.curitiba.pr.leg.br/atividade-parlamentar/legislacao/imagens/bandeira-do-brasil.png/image", latitude: -9.710714159140496, longitude: -51.71970323904898),
    flag(name: "United States", icon: "https://www.gov.br/agricultura/pt-br/assuntos/relacoes-internacionais/agro-mais-investimentos/imagens/bandeira-dos-estados-unidos.png/@@images/image.png", latitude: 39.05877728221758, longitude: -102.40695945816033),
    flag(name: "Canada", icon: "https://s3.static.brasilescola.uol.com.br/be/2022/10/bandeira-do-canada.jpg", latitude: 60.24047913202143, longitude: -111.68003574030831)
]


struct SwiftUIView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -8.66957999168462, longitude: -56.02634368879719),
            span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
        )
    )
    var body: some View {
        ZStack {
            Map(position: $position)
            VStack{
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    .frame(height: 200)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("World map")
                            .bold()
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
                HStack{
                    ForEach(flags){flag in
                        Button {
                                
                            } label: {
                                AsyncImage(url: URL(string: flag.icon)){result in
                                    result.image?
                                        .resizable()
                                }
                                .frame(width: 120, height: 75)
                            }
                            
                        }
                }
                .padding(.bottom, 30)
            }
            .ignoresSafeArea()
        }

    }
}

#Preview {
    SwiftUIView()
}
