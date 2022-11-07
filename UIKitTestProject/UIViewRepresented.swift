//
//  UIViewRepresented.swift
//  UIKitTestProject
//
//  Created by hideto.higashi on 2022/11/07.
//

import SwiftUI
import Foundation

struct UIViewReresented<UIViewType: UIView>: UIViewRepresentable {
    let makeUIView: (Context) -> UIViewType
    let updateUIView: (UIViewType, Context) -> Void = { _, _ in }
    
    func makeUIView(context: Context) -> UIViewType {
        self.makeUIView(context)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        self.updateUIView(uiView, context)
    }
}
