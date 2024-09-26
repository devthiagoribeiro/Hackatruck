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
    let name: String
    let icon: String
    let flagIcon: String
    let coordenate: CLLocationCoordinate2D
    let description: String
}

var ola = [
    flag(name: "Brazil", icon: "https://www.curitiba.pr.leg.br/atividade-parlamentar/legislacao/imagens/bandeira-do-brasil.png/image",flagIcon: "🇧🇷",coordenate:  CLLocationCoordinate2D(latitude: -9.710714159140496, longitude: -51.71970323904898), description: "O Brasil é um país vasto e diverso, conhecido por suas paisagens deslumbrantes, como a Amazônia, o Pantanal e as praias do litoral. Com uma rica cultura que mistura influências indígenas, africanas e europeias, o Brasil é famoso por suas festas, como o Carnaval, e sua música, incluindo samba e bossa nova. A gastronomia também é variada, destacando pratos como feijoada e acarajé. Além disso, o Brasil é um dos maiores produtores de café do mundo e possui uma biodiversidade incrível."),
    flag(name: "United States", icon: "https://www.gov.br/agricultura/pt-br/assuntos/relacoes-internacionais/agro-mais-investimentos/imagens/bandeira-dos-estados-unidos.png/@@images/image.png",flagIcon: "🇺🇸", coordenate: CLLocationCoordinate2D(latitude: 39.05877728221758, longitude: -102.40695945816033), description: "Os Estados Unidos são um país extenso e diverso, composto por 50 estados, cada um com sua própria cultura e características. Conhecido por sua influência econômica e política global, o país é famoso por cidades icônicas como Nova York, Los Angeles e Chicago. A cultura americana é marcada por inovações em música, cinema e tecnologia, com estilos como jazz, rock e hip-hop. A culinária é igualmente variada, refletindo as muitas culturas que compõem a sociedade, com pratos como hambúrgueres, pizzas e churrascos. Os EUA também são conhecidos por seus belos parques nacionais, que preservam paisagens naturais impressionantes."),
    flag(name: "Canada", icon: "https://s3.static.brasilescola.uol.com.br/be/2022/10/bandeira-do-canada.jpg",flagIcon:"🇨🇦", coordenate: CLLocationCoordinate2D(latitude: 60.24047913202143, longitude: -111.68003574030831), description: "O Canadá é um país vasto e multicultural, conhecido por suas paisagens deslumbrantes, como montanhas, lagos e florestas. Com duas línguas oficiais, inglês e francês, reflete uma rica diversidade cultural. Cidades como Toronto, Vancouver e Montreal oferecem uma mistura vibrante de culturas e tradições. O país é famoso por sua hospitalidade, qualidade de vida e políticas de inclusão. Além disso, o Canadá possui uma natureza impressionante, com parques nacionais que preservam a vida selvagem e a beleza natural. Os canadenses também têm orgulho do hóquei no gelo, que é um dos esportes mais populares do país.")
]

struct SheetView: View {
    @State var name: String
    @State var icon: String
    @State var desc: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text(name)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.top,40)
            AsyncImage(url: URL(string: icon)){result in
                result.image?
                    .resizable()
            }
            .scaledToFit()
            .frame(width: 300)
            Text(desc)
                .frame(width: 300)
                .padding(.top,20)
                .multilineTextAlignment(.center)
            Spacer()
            Button("voltar") {
                dismiss()
            }
        }
    }
}


struct SwiftUIView: View {
    @State private var loc = ""
    @State private var flagIcon = ""
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -8.66957999168462, longitude: -56.02634368879719),
            span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
        )
    )
    @State private var showingSheet = false
    @State private var isPresentflag: flag? = nil
    
    var body: some View {
        ZStack {
            Map(position: $position){
                ForEach(ola) { ola in
                    Annotation(ola.name, coordinate: ola.coordenate) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.black)
                            Text(ola.flagIcon)
                                .padding(5)
                        }
                        .onTapGesture(count: 1) {
                            isPresentflag = ola
                        }
                        .sheet(item: $isPresentflag) {ola in
                            SheetView(name: ola.name, icon: ola.icon, desc: ola.description)
                        }
                    }
                }
            }
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
                            .padding(.bottom, 10)
                        Text(loc)
                    }
                }
                Spacer()
                HStack{
                    ForEach(ola){flagis in
                        Button {
                            loc = flagis.name
                            position = .region(
                                MKCoordinateRegion(
                                    center: (flagis.coordenate),
                                    span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
                                )
                            )
                                
                            } label: {
                                AsyncImage(url: URL(string: flagis.icon)){result in
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


