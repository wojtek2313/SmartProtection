//
//  JobTrackerView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct JobTrackerView: View {
    // MARK: - Public Properties
    
    @State var constructionName: String = "Motława"
    
    // MARK: - Initializers
    
    init() {}
    
    // MARK: - UI
    
    var body: some View {
        ScrollView {
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
            SPProgressView(logic: SPProgressLogic(progress: SPProgress(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: Date()))))
                .padding()
        } header: {
            createHeader(at: .timer)
        }
    }
    
    private var bhpSection: some View {
        Section {
            Text("BHP")
        } header: {
            createHeader(at: .bhp)
        }
    }
    
    private var documentsSection: some View {
        Section {
            SPButton(type: .documents, height: Constants.height, titleFont: .headline) {
                // TODO: - ACTION GOES HERE
            }
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
    }
}
