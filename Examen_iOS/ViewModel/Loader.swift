//
//  Loader.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 13/11/22.
//

import Foundation
import Firebase
import Combine
import FirebaseStorage

class Loader: ObservableObject {
    
    var didChenge = PassthroughSubject<Data?,Never>()
    
    @Published var data: Data? = nil {
        didSet {
            didChenge.send(data)
        }
    }
    
    init(imageUrl: String) {
        let storageImagen = Storage.storage().reference(forURL: imageUrl)
        storageImagen.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("error al traer imagenes", error.localizedDescription)
            }else{
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }
    }
    
}
