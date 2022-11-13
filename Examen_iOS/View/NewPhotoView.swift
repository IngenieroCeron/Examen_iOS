//
//  NewPhotoView.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import SwiftUI

struct NewPhotoView: View {
    
    @State var image: Image?
    @State var showAlert: Bool = false
    @State var isCameraActive = false
    @State var showImage = false
    @Binding var showPopup: Bool
    
    @Binding var imageData : Data
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationView {
                VStack {
                    
                    HStack {
                        Spacer()
                        Button {
                            showPopup = false
                        } label: {
                            Image(systemName: "x.circle")
                                .font(.title)
                                .foregroundColor(.white)
                        }

                    }
                    
                    Text("Selecciona")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 25)
                    
                    Button {
                        if self.imageData.count != 0{
                            showImage.toggle()
                        } else {
                            showAlert = true
                        }
                        
                    } label: {
                        Text(showImage ? "Ocultar foto": "Visualizar foto")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.pink)
                    .cornerRadius(10)
                    
                    Button(action:{
                        self.mostrarMenu.toggle()
                    }){
                        Text("Cargar foto")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.actionSheet(isPresented: self.$mostrarMenu) {
                        ActionSheet(title: Text("Menu"), message: Text("Selecciona una opción"), buttons: [
                            .default(Text("Camara"), action: {
                                self.source = .camera
                                self.imagePicker.toggle()
                            }),
                            .default(Text("Libreria"), action: {
                                self.source = .photoLibrary
                                self.imagePicker.toggle()
                            }),
                            .default(Text("Cancelar"))
                            
                        ])
                    }
                    .padding(.horizontal, 35)
                    .padding(.vertical, 8)
                    .background(Color.pink)
                    .cornerRadius(10)
                    
                    if showImage {
                        Image(uiImage: UIImage(data: self.imageData)!)
                            .resizable()
                            .frame(width: 350, height: 300)
                            .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: ImagePicker(show: self.$imagePicker, image: self.$imageData, source: self.source), isActive: self.$imagePicker) {
                        EmptyView()
                    }.navigationBarTitle("")
                     .navigationBarHidden(true)
                    
                    Spacer()
                    
                }
                .alert("Aun no existe ninguna foto, primero toma una selfie", isPresented: $showAlert, actions: {
                    Button("Ok", role: .cancel) {}
                })
                .frame(width: 300, height: 600)
                .background(Color.blue)
                .cornerRadius(12)
        }
    }
    
}

//struct NewPhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPhotoView(showPopup: false)
//    }
//}
