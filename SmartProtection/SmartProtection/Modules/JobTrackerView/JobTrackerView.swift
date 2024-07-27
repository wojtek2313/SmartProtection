//
//  JobTrackerView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct JobTrackerView: View {
    @State var constructionName: String = "Motława"
    
    var body: some View {
        ScrollView {
            idCardSection
            timerSection
            bhpSection
            documentsSection
        }
    }
    
    private var idCardSection: some View {
        Section {
            Text("CARD")
        } header: {
            createHeader(at: .constructionCard)
        }
    }
    
    private var timerSection: some View {
        Section {
            Text("TIMER")
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
            Text("DOCUMENTS")
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
}

struct JobTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        JobTrackerView()
    }
}
