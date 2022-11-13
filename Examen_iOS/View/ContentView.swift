//
//  ContentView.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var yourName: String = ""
    @State var showPopup: Bool = false
    @State var showGraphicView = false
    @State var imageData : Data = .init(capacity: 0)
    
    //MARK: - BODY
    
    var body: some View {
            ZStack {
                
                //MARK: - BACKGROUNDCOLOR
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                //MARK: - MAIN VSTACK
                VStack {
                    Text("Examen iOS")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    
                    List {
                        TextField("Ingresa tu nombre", text: $yourName)
                            .keyboardType(.alphabet)
                        
                        Text("Agregar selfie")
                            .onTapGesture {
                                showPopup = true
                                
                            }
                        Text("Ver Graficas")
                            .onTapGesture {
                                showGraphicView = true
                            }
                        
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    
                    
                    
                }//: VSTACK
                .blur(radius: showPopup ? 8.0 : 0)
                .sheet(isPresented: $showGraphicView) {
                    GraphicView(name: yourName, showGraphicView: $showGraphicView, imageData: imageData)
                }
                
                if showPopup {
                    BlankView()
                        .onTapGesture {
                            
                            showPopup = false
                            
                        }
                    NewPhotoView(showPopup: $showPopup, imageData: $imageData)
                }
                
            }
        
    }
}

//MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
