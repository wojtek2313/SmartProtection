//
//  TodoTaskLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 07/11/2024.
//

import Foundation

class TodoTaskLogic: ObservableObject {
    // MARK: - Public Properties
    
    public private(set) var tasks: [TaskModel] = [TaskModel(id: "123wqdkqe12e", name: "Sprzątanie", time: "1h:22min", numberInStack: "1/3"),
                                                  TaskModel(id: "123wqd2kqe12e", name: "Sprzątanie", time: "1h:22min", numberInStack: "2/3"),
                                                  TaskModel(id: "123wqdasde12e", name: "Sprzątanie", time: "1h:29min", numberInStack: "3/3"),]
    
    
}
