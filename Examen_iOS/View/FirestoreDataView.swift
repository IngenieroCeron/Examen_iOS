//
//  FirestoreDataView.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import SwiftUI
import Firebase

struct FirestoreDataView: View {
    
    @ObservedObject var datosFirebase = GetFirebaseData()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Datos guardados en Firebase")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                if datosFirebase.datos.isEmpty {
                    Text("Aqui se mostrarán los registros que se vayan guardando en firestore")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .opacity(0.5)
                } else {
                    List {
                        ForEach(datosFirebase.datos) { dato in
                            HStack {
                                imagenFirebase(imageUrl: dato.imagen)
                                    
                                Text("Nombre: \(dato.nombre)")
                                    .font(.title3)
                                .fontWeight(.bold)
                            }
                        }
                        .onDelete { (index) in
                            let id = self.datosFirebase.datos[index.first!].id
                            let db = Firestore.firestore()
                            db.collection("Posts").document(id).delete()
                            self.datosFirebase.datos.remove(atOffsets: index)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                Spacer()
            }
        }
    }
}

struct FirestoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        FirestoreDataView()
    }
}
