//
//  ImageView.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import SwiftUI

struct ImageView: View {
    
    @State private var imageData : Data = .init(capacity: 0)
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: self.imageData)!)
                .resizable()
                .scaledToFit()
        }
            
    }
    
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
