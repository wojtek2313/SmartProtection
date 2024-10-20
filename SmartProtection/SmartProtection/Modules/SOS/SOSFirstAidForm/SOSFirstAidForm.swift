//
//  SOSFirstAidForm.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 13/10/2024.
//

import LoadingButton
import SmartProtectionUI
import SwiftUI

struct SOSFirstAidForm: View {
    // MARK: - Environment Objects
    
    @EnvironmentObject var router: Router
    
    // MARK: - Private Properties
    
    @StateObject private var logic: FirstAidLogic
    @State private var keyboardHeight: CGFloat = 0
    @State private var scrollToId: Int = 0
    
    // MARK: - Initializers
    
    init(dependencyFactory: DependenciesFacotry) {
        _logic = StateObject(wrappedValue: dependencyFactory.createFirsAidLogic())
    }
    
    // MARK: - UI
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        header
                        sosQuestionsForm
                    }
                }
                .padding(.horizontal)
                .keyboardHeight($keyboardHeight)
                .onChange(of: scrollToId) { value in
                    withAnimation {
                        proxy.scrollTo(value, anchor: .center)
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: keyboardHeight / 2)
        }
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
            isConsciousForm.id(Constants.Form.Conscious.id)
            if logic.sample.isConscious != nil {
                reasonForm.id(Constants.Form.Reason.id)
            }
            if logic.sample.reason != nil {
                symptomsForm.id(Constants.Form.Symptoms.id)
            }
            if logic.sample.symptoms != nil {
                lunchForm.id(Constants.Form.LastLunch.id)
            }
            if logic.sample.lastLunch != nil {
                soberForm.id(Constants.Form.Sober.id)
            }
            if logic.sample.isSober != nil {
                loadingButton
                    .padding()
                    .id(Constants.LoaderButton.id)
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
                    scrollToId = Constants.Form.Conscious.id + 1
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
                    scrollToId = Constants.Form.Reason.id + 1
                }
            if logic.selectedReasonItem == .others {
                SPTextField(type: .whatHasHappend, onChange: {
                    logic.update(reason: $0)
                    
                })
                .onSubmit { scrollToId = Constants.Form.Reason.id + 1 }
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
                    scrollToId = Constants.Form.Symptoms.id + 1
                }
            if logic.selectedSymptomItem == .others {
                SPTextField(type: .whatHasHappend, onChange: {
                    logic.update(symptoms: $0)
                })
                .onSubmit { scrollToId = Constants.Form.Symptoms.id + 1 }
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
                    scrollToId = Constants.Form.LastLunch.id + 1
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
                    scrollToId = Constants.Form.Sober.id + 1
                }
        }
        .padding(.bottom)
    }
    
    private var loadingButton: LoadingButton<Text> {
        LoadingButton(
            action: logic.sendEvent,
            isLoading: $logic.isLoading,
            style: LoadingButtonStyle(
                height: Constants.LoaderButton.height,
                cornerRadius: Constants.LoaderButton.cornerRadius,
                backgroundColor: .spBlue),
            builder: {
                Text("SP_SEND_EVENT".localized)
                    .foregroundColor(.white)
            }
        )
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Cancel Button
        struct CancelButton {
            static let width: CGFloat = 20
            static let height: CGFloat = 20
            static let padding: CGFloat = 18
        }
        
        /// Title
        struct Title {
            static let padding: CGFloat = 5
        }
        
        /// Form
        struct Form {
            /// Conscious
            struct Conscious {
                static let id: Int = 0
            }
            
            /// Reason
            struct Reason {
                static let id: Int = 1
            }
            
            /// Symptoms
            struct Symptoms {
                static let id: Int = 2
            }
            
            /// Last Lunch
            struct LastLunch {
                static let id: Int = 3
            }
            
            /// Sober
            struct Sober {
                static let id: Int = 4
            }
        }
        
        /// Loader Button
        struct LoaderButton {
            static let cornerRadius = 5.0
            static let height = 40.0
            static let id = 5
        }
    }
}
