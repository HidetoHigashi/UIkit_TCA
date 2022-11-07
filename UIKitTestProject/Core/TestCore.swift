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
    }
    
    enum Action: Equatable {
        case onTapButton
    }
    
    init() {}
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onTapButton:
                print("onTapButton!")
                return .none
            }
        }
    }
    
}
