//
//  SOSFirstAidForm.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 13/10/2024.
//

import SmartProtectionUI
import SwiftUI

struct SOSFirstAidForm: View {
    // MARK: - Environment Objects
    
    @EnvironmentObject var router: Router
    
    // MARK: - Private Properties
    
    @StateObject private var logic: FirstAidLogic
    @State private var keyboardHeight: CGFloat = 0
    
    // MARK: - Initializers
    
    init(dependencyFactory: DependenciesFacotry) {
        _logic = StateObject(wrappedValue: dependencyFactory.createFirsAidLogic())
    }
    
    // MARK: - UI
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    header
                    sosQuestionsForm
                }
            }
        }
        .padding(.horizontal)
        .keyboardHeight($keyboardHeight)
    }
    
    private var header: some View {
        VStack {
            title
            subtitle
        }
    }
    
    private var title: some View {
        HStack {
            Text("SOS_FIRST_AID_FORM_TITLE".localized)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.bottom, Constants.Title.padding)
    }
    
    private var subtitle: some View {
        HStack {
            Text("SOS_FIRST_AID_FORM_SUBTITLE".localized)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
    }
    
    private var sosQuestionsForm: some View {
        VStack(alignment: .leading) {
            isConsciousForm
            if logic.sample.isConscious != nil {
                reasonForm
            }
            if logic.sample.reason != nil {
                symptomsForm
            }
            if logic.sample.symptoms != nil {
                lunchForm
            }
            if logic.sample.lastLunch != nil {
                soberForm
            }
        }
        .padding(.top)
    }
    
    private var isConsciousForm: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_FIRST_AID_FORM_IS_CONSCIOUS_QUESTION".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<ConsciousItem>(selectedItem: $logic.selectedConsciousItem)
                .padding(.leading)
                .onChange(of: logic.selectedConsciousItem) { isConscious in
                    guard let isConscious = isConscious else { return }
                    logic.update(isConscious: isConscious.output)
                }
        }
        .padding(.bottom)
    }
    
    private var reasonForm: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_FIRST_AID_FORM_WHAT_HAPPEND_QUESTION".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<ReasonItem>(selectedItem: $logic.selectedReasonItem)
                .padding(.leading)
                .onChange(of: logic.selectedReasonItem) { reason in
                    guard reason != .others, let reasonInput = reason?.title else {
                        return
                    }
                    logic.update(reason: reasonInput)
                }
            if logic.selectedReasonItem == .others {
                SPTextField(type: .whatHasHappend, onChange: { logic.update(reason: $0) })
            }
        }
        .padding(.bottom)
    }
    
    private var symptomsForm: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_FIRST_AID_FORM_KIND_OF_SYMPTOMS".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<SymptomItem>(selectedItem: $logic.selectedSymptomItem)
                .padding(.leading)
                .onChange(of: logic.selectedSymptomItem) { symptom in
                    guard symptom != .others, let symptomInput = symptom?.title else {
                        return
                    }
                    logic.update(symptoms: symptomInput)
                }
            if logic.selectedSymptomItem == .others {
                SPTextField(type: .whatHasHappend, onChange: { logic.update(symptoms: $0) })
            }
        }
        .padding(.bottom)
    }
    
    private var lunchForm: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_FIRST_AID_FORM_LAST_LUNCH".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<LunchItem>(selectedItem: $logic.selectedLastLunch)
                .padding(.leading)
                .onChange(of: logic.selectedLastLunch) { symptom in
                    guard let lunchInput = symptom?.title else {
                        return
                    }
                    logic.update(afterLunch: lunchInput)
                }
        }
        .padding(.bottom)
    }
    
    private var soberForm: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_FIRST_AID_FORM_IS_SOBER".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<SoberItem>(selectedItem: $logic.selectedSoberItem)
                .padding(.leading)
                .onChange(of: logic.selectedSoberItem) { sober in
                    guard let soberInput = sober?.title else {
                        return
                    }
                    logic.update(isSober: soberInput)
                }
        }
        .padding(.bottom)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Cancel Button
        struct CancelButton {
            static let width: CGFloat = 20
            static let height: CGFloat = 20
            static let padding: CGFloat = 18
        }
        
        struct Title {
            static let padding: CGFloat = 5
        }
    }
}
