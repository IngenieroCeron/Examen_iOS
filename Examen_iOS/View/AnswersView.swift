//
//  AnswersView.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import SwiftUI

struct AnswersView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        Text("Preguntas y Respuestas")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 18)
                        Text("1. Explique el ciclo de vida de un UIViewController.")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("1. viewDidLoad: Este método se llama para notificar al ViewController de que su vista se ha cargado en memoria. Dentro de este método podemos añadir lógica, añadir subvistas, añadir constraints, etc.\n2. viewWillAppear: Este es el segundo método que se llama y es cuando la vista está preparada y se va a mostrar en nuestro ViewController.\n3. viewWillLayoutSubviews: Este método se llama para notificar al ViewController de que la vista está apunto de posicionar sus subvistas.\n4. viewDidLayoutSubviews: Se llama a este método para notificar al ViewController de que la vista acaba de posicionar todas sus subvistas.\n5. viewDidAppear: Se llama cuando la vista ya se ha cargado en el ViewController y se está mostrando al user.\n6. viewWillDisappear: Se llama para notificar al ViewController de que la vista está apunto de ser eliminada de la jerarquía de vistas.\n7. viewDidDisappear: Con este recibimos una notificación al ViewController de que la vista ya ha sido eliminada de la jerarquía")
                            .foregroundColor(.white)
                        Text("2. ¿En qué casos se usa un weak, un strong y un unowned?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Strong: Las referencias strong hacen que el sistema ARC sume 1 al contador de referencias y esta no se pueda eliminar de la memoria hasta que su valor sea nulo.\nWeak: Las referencias weak si le permiten a ARC limpiar automáticamente la memoria cuando ya no está en uso. Tiene la particularidad que se pueden manejar valores opcionales.\nUnknown: Estas son similares a las weak pero estas no permiten valores nulos en tiempo de ejecución. también pueden ser opcionales pero tienes que estar 100% seguro que contiene info en tiempo de ejecución si no va a fallar la aplicación.")
                            .foregroundColor(.white)
                        
                    }
                    VStack {
                        Text("3. ¿Qué es el ARC?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Es un sistema que nos brinda swift para hacer el manejo de instancias almacenadas en memoria. Se encarga de contar cada una de las referencias o instancias strong que apuntan a una dirección de memoria y cuando el conteo es igual a cero la elimina automáticamente y libera la memoria utilizada, es decir si no hay ninguna referencia a una clase, ARC libera ese espacio de memoria. Todos los atributos que se crean por defecto en una clase son strong. Retain Cycle: Es cuando dos referencias strong se apuntan se apuntan una a la otra, causando que ARC no pueda limpiar dicha dirección de memoria. Entonces si sales y entras a una pantalla y la referencia no se elimina cada vez consumirá más espacio y más espacio, hasta que se quede sin espacio de memoria y ya no quepa en memoria eso se conoce como memory leak.")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct AnswersView_Previews: PreviewProvider {
    static var previews: some View {
        AnswersView()
    }
}
