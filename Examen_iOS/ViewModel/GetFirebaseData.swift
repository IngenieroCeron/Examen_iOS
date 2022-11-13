//
//  GetFirebaseData.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import Foundation
import Firebase
import SwiftUI

class GetFirebaseData: ObservableObject {
    
    @Published var datos = [Modelo]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("Posts").addSnapshotListener { (QuerySnapshot, error) in
            if let error = error {
                print("error al mostrar datos", error.localizedDescription)
            } else {
                self.datos.removeAll()
                for document in QuerySnapshot!.documents {
                    let valor = document.data()
                    let id = document.documentID
                    let nombre = valor["nombre"] as? String ?? "sin nombre"
                    let imagen = valor["imagen"] as? String ?? "sin imagen"
                    
                    DispatchQueue.main.async {
                        let registros = Modelo(id: id, nombre: nombre, imagen: imagen)
                        self.datos.append(registros)
                    }
                    
                }
            }
        }
    }
    
}
