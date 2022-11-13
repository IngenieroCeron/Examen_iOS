//
//  MainView.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import SwiftUI

struct MainView: View {
    
    @State var tabSelected: Int = 0
    
    var body: some View {
        TabView(selection: $tabSelected) {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
            AnswersView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Respuestas")
                }
            FirestoreDataView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("Firebase")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
