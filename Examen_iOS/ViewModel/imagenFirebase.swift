//
//  imagenFirebase.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 13/11/22.
//

import Foundation
import SwiftUI
import UIKit

let imagenAlternativa = UIImage(systemName: "photo")

struct imagenFirebase : View {
    
    @ObservedObject var imageLoader : Loader
    
    init(imageUrl: String) {
        self.imageLoader = Loader(imageUrl: imageUrl)
    }
    
    var image: UIImage? {
        self.imageLoader.data.flatMap(UIImage.init)
    }
    
    var body : some View {
        Image(uiImage: image ?? imagenAlternativa!)
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(
              RoundedRectangle(cornerRadius: 12)
            )
    }
}

    
