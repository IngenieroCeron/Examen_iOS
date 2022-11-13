//
//  BlankView.swift
//  CoreDataIntro
//
//  Created by Eduardo Ceron on 03/04/22.
//

import SwiftUI

struct BlankView: View {
  // MARK: - PROPERTY
  
  
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(Color.gray)
    .opacity(0.5)
    .blendMode(.overlay)
    .edgesIgnoringSafeArea(.all)
  }
}

// MARK: - PREVIEW

struct BlankView_Previews: PreviewProvider {
  static var previews: some View {
    BlankView()
  }
}
