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
        case onDismissAlert(String)
    }
    
    init() {}
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onTapButton:
                guard let message = state.text else { return .none }
                state.alert = AlertState(title: TextState("タイトル"),
                                         message: TextState("\(message)"))
                return .none
            case .textChange(let text):
                state.text = text
                return .none
            case .onDismissAlert(let response):
                print(response)
                state.alert = nil
                return .none
            }
        }
    }
    
}
