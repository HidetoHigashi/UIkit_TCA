//
//  TestCore.swift
//  UIKitTestProject
//
//  Created by hideto.higashi on 2022/11/07.
//

import Foundation
import ComposableArchitecture


struct Test: ReducerProtocol {
    
    struct State: Equatable {
        var alert: AlertState<Action>?
        var text: String?
    }
    
    enum Action: Equatable {
        case onTapButton
        case textChange(String)
    }
    
    init() {}
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onTapButton:
                print("onTapButton!")
                return .none
            case .textChange(let text):
                state.text = text
                print(state.text)
                return .none
            }
        }
    }
    
}
