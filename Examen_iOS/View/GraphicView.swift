//
//  GraphicView.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import SwiftUI
import Charts
import Firebase
import FirebaseStorage

struct GraphicView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var porcentaje: CGFloat = 0
    @State var name: String
    @Binding var showGraphicView: Bool
    
    @State var imageData : Data
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    private func guardar() {
        // guardar imagen
        let storage = Storage.storage().reference()
        let nombreImagen = UUID()
        let directorio = storage.child("imagenesPost/\(nombreImagen)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        directorio.putData(self.imageData, metadata: metadata) { (data, error) in
            if error == nil {
                print("guardo imagen")
            }else{
                if let error = error?.localizedDescription {
                    print("error en firebase al cargar imagen", error)
                }else{
                    print("error en imagenes")
                }
            }
        }
        
        
        
        // guardar texto
        let db = Firestore.firestore()
        let registro: [String:Any] = ["nombre":self.name, "imagen":String(describing: directorio)]
        db.collection("Posts").addDocument(data: registro) { (error) in
            if let error = error {
                print("Falló a guardar", error.localizedDescription)
            } else {
                print("Se guardó correctamente")
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Capsule()
                            .frame(width: 120, height: 6)
                            .foregroundColor(Color.secondary)
                            .opacity(0.4)
                            .padding(.top, 8)
                        NavigationLink(destination: ImagePicker(show: self.$imagePicker, image: self.$imageData, source: self.source), isActive: self.$imagePicker) {
                            Text("")
                        }.navigationBarTitle("")
                            .navigationBarHidden(true)
                        Text("Graficas")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental).")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        ForEach(networkManager.questionsInfo, id: \.self) { question in
                            Text("\(question.pregunta)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Chart(question.values, id: \.self) { value in
                                BarMark(x: .value("", value.label), y: .value("", value.value))
                            }
                            .frame(height: 100)
                            .foregroundColor(Color.white)
                            ZStack {
                                ForEach(question.values, id: \.self){ value in
                                    
                                    Circle()
                                        .trim(from: 0, to: CGFloat(Double(value.value) * 0.01))
                                        .stroke(Color.white, lineWidth: 10)
                                    
                                        .frame(width: 250)
                                }
                            }
                            ForEach(question.values, id: \.self){ value in
                                HStack() {
                                    Text("\(value.label)")
                                    
                                    Spacer()
                                    Text("\(value.value)%")
                                }
                                .frame(width: 160)
                            }
                            Divider().frame(height: 5).background(.white)
                                .padding(.horizontal)
                        }
                        
                        
                        Button {
                            guardar()
                            showGraphicView = false
                        } label: {
                            HStack {
                                Text("Guardar foto y nombre")
                                Image(systemName: "arrow.up.forward.circle")
                                    .imageScale(.large)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
                            )
                        }
                        .padding()
                        
                        
                    }//: VSTACK
                    .foregroundColor(.white)
                }//: SCROLLVIEW
            }
            .onAppear{
                networkManager.fetchData()
        }
        }
    }
}

//struct GraphicView_Previews: PreviewProvider {
//    static var previews: some View {
//        GraphicView(name: "Marco", showGraphicView: .constant(true))
//    }
//}
