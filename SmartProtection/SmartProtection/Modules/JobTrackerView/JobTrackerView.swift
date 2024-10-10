//
//  JobTrackerView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct JobTrackerView: View {
    // MARK: - Private Properties
    
    private var dependencyFactory: DependenciesFacotry
    
    // MARK: - Public Properties
    
    @State var constructionName: String = "Motława"
    
    // MARK: - Initializers
    
    public init(dependencyFactory: DependenciesFacotry) {
        self.dependencyFactory = dependencyFactory
    }
    
    // MARK: - UI
    
    var body: some View {
        ScrollView {
            SPConstructionMenu(constructionName: "Budowa")
            idCardSection
            timerSection
            bhpSection
            documentsSection
        }
        .scrollIndicators(.hidden)
    }
    
    private var idCardSection: some View {
        Section {
            // TODO: - PASS MODEL TO VIEW
            
            SPCardView(
                cardId: "ACE1234",
                name: "Wojtek",
                surname: "Kulas",
                company: "NAZWA"
            )
            .padding(.horizontal)
        } header: {
            createHeader(at: .constructionCard)
        }
    }
    
    private var timerSection: some View {
        Section {
            let logic = dependencyFactory.createProgress(numberOfTotalDailyWorkHours: 8, startHour: Date())
            SPProgressView(logic: logic)
                .padding()
        } header: {
            createHeader(at: .timer)
        }
    }
    
    private var bhpSection: some View {
        Section {
            let logic = dependencyFactory.createBHPLogic(items: [SPBHP.Item(name: "kask", isWerable: false)])
            SPBHPView(logic: logic)
        } header: {
            createHeader(at: .bhp)
        }
    }
    
    private var documentsButton: some View {
        NavigationLink(destination: DocumentsView(), label: {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .foregroundColor(.spBlue)
                .frame(height: Constants.height)
                .overlay {
                    Text("SP_BUTTON_DOCUMENTS".localized)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .shadow(
                    color: .black,
                    radius: Constants.Shadow.radius,
                    x: Constants.Shadow.xPosition,
                    y: Constants.Shadow.yPosition
                )
        })
    }
    
    private var documentsSection: some View {
        Section {
            documentsButton
            .padding()
            .padding(.bottom, Constants.padding)
        } header: {
            createHeader(at: .documents)
        }
    }
    
    private func createHeader(at type: JobTrackerHeaderType) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(type.title)
                    .font(.headline)
            }
            .foregroundColor(.black)
            
            Text(type.subtitle)
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let padding: CGFloat = 150
        static let height: CGFloat = 45
        static let cornerRadius = 5.0
        
        /// Shadow
        struct Shadow {
            static let radius = 3.0
            static let xPosition = 0.0
            static let yPosition = 1.0
        }
    }
}
