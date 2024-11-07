//
//  TODOTaskView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 07/11/2024.
//

import CardStack
import SwiftUI

struct TODOTaskView: View {
    // MARK: - Private Properties
    
    @ObservedObject var logic: TodoTaskLogic
    
    // MARK: - Initializers
    
    init(logic: TodoTaskLogic = TodoTaskLogic()) {
        self.logic = logic
    }
    
    // MARK: - UI
    
    var body: some View {
        CardStack(direction: LeftRight.direction, data: logic.tasks, onSwipe: { _, _ in }, content: { task, _, _ in
            card(for: task)
        })
        .frame(height: Constants.height)
        .padding(.horizontal)
        .padding(.bottom, Constants.padding)
    }
    
    private func card(for task: TaskModel) -> some View {
        cardBackground.overlay { taskDataContainer(from: task) }
    }
    
    private func taskDataContainer(from task: TaskModel) -> some View {
        VStack {
            Text(task.name)
                .font(.custom(Constants.Font.font, fixedSize: Constants.Font.size))
            Text("TASK_DURING_REALIZATION".localized + task.time)
                .font(.custom(Constants.Font.fontMedium, fixedSize: Constants.Font.small))
            Text("TASK_NUMBER".localized + task.numberInStack)
                .font(.custom(Constants.Font.fontMedium, fixedSize: Constants.Font.small))
        }
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: Constants.RoundedRectangle.cornerRadius)
            .frame(
                minHeight: Constants.RoundedRectangle.minHeight,
                idealHeight: Constants.RoundedRectangle.idealHeight,
                maxHeight: Constants.RoundedRectangle.maxHeight,
                alignment: .center
            )
            .foregroundColor(.white)
            .shadow(color: .black, radius: Constants.RoundedRectangle.radius, x: 0, y: Constants.RoundedRectangle.y)
            .padding()
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let height: CGFloat = 190
        static let padding: CGFloat = 30
        
        /// Rounded Rectangle
        struct RoundedRectangle {
            static let cornerRadius: CGFloat = 8
            static let minHeight: CGFloat = 189
            static let idealHeight: CGFloat = 189
            static let maxHeight: CGFloat = 190
            static let radius: CGFloat = 4
            static let y: CGFloat = 2
        }
        
        /// Font
        struct Font {
            static let font = "Avenir Next Bolt"
            static let fontMedium = "Avenir Next Medium"
            static let size = 14.0
            static let small = 10.0
        }
    }
}
