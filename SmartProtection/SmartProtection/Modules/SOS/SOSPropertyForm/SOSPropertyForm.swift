//
//  SOSPropertyForm.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 13/10/2024.
//

import LoadingButton
import SmartProtectionUI
import SwiftUI

struct SOSPropertyForm: View {
    // MARK: - Environment Objects
    
    @EnvironmentObject var router: Router
    
    // MARK: - Private Properties
    
    @StateObject private var logic: SOSPropertyLogic
    @State private var keyboardHeight: CGFloat = 0
    @State private var scrollToId: Int = 0
    @Binding private var isPresented: Bool
    
    // MARK: - Initializers
    
    init(
        dependencyFactory: DependenciesFacotry,
        isPresented: Binding<Bool>
    ) {
        _logic = StateObject(wrappedValue: dependencyFactory.createSOSPropertyLogic())
        _isPresented = isPresented
    }
    
    // MARK: - UI
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        header
                        sosPropertyForm
                    }
                }
                .padding(.horizontal)
                .keyboardHeight($keyboardHeight)
                .onChange(of: scrollToId) { value in
                    withAnimation {
                        proxy.scrollTo(value, anchor: .center)
                    }
                }
                .onChange(of: logic.closeModal) { isClosed in
                    isPresented = !isClosed
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
            Text("SOS_PROPERTY_FORM_TITLE".localized)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.bottom, Constants.Title.padding)
    }
    
    private var subtitle: some View {
        HStack {
            Text("SOS_PROPERTY_FORM_SUBTITLE".localized)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
    }
    
    private var sosPropertyForm: some View {
        VStack(alignment: .leading) {
            whatHasHappendForm.id(Constants.Form.WhatHasHappend.id)
            if logic.model.reason != nil && logic.selectedWhatHasHappendItem == .fire {
                whatIsUnderTheFire.id(Constants.Form.UnderFire.id)
            }
            if logic.model.reason != nil && logic.selectedWhatHasHappendItem == .robbery {
                whatHasBeenRobbed.id(Constants.Form.Robbed.id)
            }
            if logic.model.reason != nil && logic.selectedWhatHasHappendItem == .collision {
                whatIsUnderCollision.id(Constants.Form.Collision.id)
            }
            if logic.model.reason != nil && logic.selectedWhatHasHappendItem == .machineDamage {
                whichMachineHasBeenDamaged.id(Constants.Form.MachineDamaged.id)
            }
            if logic.model.item != nil || (logic.model.reason != nil && logic.selectedWhatHasHappendItem == .other) {
                isNeededExchange.id(Constants.Form.Exchange.id)
            }
            if logic.model.isExchangeNeeded != nil {
                loadingButton
                    .padding()
                    .id(Constants.LoaderButton.id)
            }
        }
        .padding(.top)
    }
    
    private var whatHasHappendForm: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_PROPERTY_FORM_WHAT_HAPPEND_QUESTION".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<WhatHasHappendItem>(selectedItem: $logic.selectedWhatHasHappendItem)
                .padding(.leading)
                .onChange(of: logic.selectedWhatHasHappendItem) { whatHappened in
                    guard whatHappened != .other, let whatHappenedInput = whatHappened else { return }
                    logic.update(reason: whatHappenedInput.title)
                    scrollToId(from: whatHappenedInput)
                }
            if logic.selectedWhatHasHappendItem == .other {
                SPTextField(type: .whatHasHappend, onChange: {
                    logic.update(reason: $0)
                })
                .onSubmit { scrollToId = Constants.Form.WhatHasHappend.id + 6 }
            }
        }
        .padding(.bottom)
    }
    
    private var whatIsUnderTheFire: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_PROPERTY_FORM_WHAT_IS_UNDER_THE_FIRE".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<UnderFireItem>(selectedItem: $logic.selectedWhatIsUnderFire)
                .padding(.leading)
                .onChange(of: logic.selectedWhatIsUnderFire) { underFire in
                    guard underFire != .other, let underFire = underFire else { return }
                    logic.update(item: underFire.title)
                }
            if logic.selectedWhatIsUnderFire == .other {
                SPTextField(type: .whatItemUnderFire, onChange: {
                    logic.update(item: $0)
                })
                .onSubmit { scrollToId = Constants.Form.UnderFire.id + 1 }
            }
        }
        .padding(.bottom)
    }
    
    private var whatHasBeenRobbed: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_PROPERTY_WHAT_HAS_BEEN_ROBBED".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPTextField(type: .whatHasBeenRobbed, onChange: {
                logic.update(item: $0)
            })
            .onSubmit { scrollToId = Constants.Form.UnderFire.id + 1 }
        }
        .padding(.bottom)
    }
    
    private var whatIsUnderCollision: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_PROPERTY_FORM_WHAT_IS_UNDER_COLISION".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPTextField(type: .whatIsUnderCollision, onChange: {
                logic.update(item: $0)
            })
            .onSubmit { scrollToId = Constants.Form.UnderFire.id + 1 }
        }
        .padding(.bottom)
    }
    
    private var whichMachineHasBeenDamaged: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_PROPERTY_WHICH_MACHINE_HAS_BEEN_DAMAGED".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPTextField(type: .whichMachineIsUnderDamaged, onChange: {
                logic.update(item: $0)
            })
            .onSubmit { scrollToId = Constants.Form.UnderFire.id + 1 }
        }
        .padding(.bottom)
    }
    
    private var isNeededExchange: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SOS_PROPERTY_FORM_NEEDED_EXCHANGE".localized)
                    .font(.callout)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
            SPRadioStack<ExchangeItem>(selectedItem: $logic.selectedExchangeItem)
                .padding(.leading)
                .onChange(of: logic.selectedExchangeItem) { item in
                    guard let item = item else { return }
                    logic.update(exchange: item.rawValue)
                    scrollToId = Constants.Form.Exchange.id + 1
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
    
    // MARK: - Private Methods
    
    private func scrollToId(from item: WhatHasHappendItem) {
        switch item {
        case .fire:
            scrollToId = Constants.Form.WhatHasHappend.id + 1
        case .collision:
            scrollToId = Constants.Form.WhatHasHappend.id + 2
        case .robbery:
            scrollToId = Constants.Form.WhatHasHappend.id + 3
        case .machineDamage:
            scrollToId = Constants.Form.WhatHasHappend.id + 4
        default:
            scrollToId = Constants.Form.WhatHasHappend.id + 5
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Title
        struct Title {
            static let padding: CGFloat = 5
        }
        
        /// Form
        struct Form {
            /// What Has Happend
            struct WhatHasHappend {
                static let id: Int = 0
            }
            /// Under Fire
            struct UnderFire {
                static let id: Int = 1
            }
            /// Collision
            struct Collision {
                static let id: Int = 2
            }
            /// Robbed
            struct Robbed {
                static let id: Int = 3
            }
            /// Machine Damaged
            struct MachineDamaged {
                static let id: Int = 4
            }
            /// Exchange
            struct Exchange {
                static let id: Int = 5
            }
        }
        
        /// Loader Button
        struct LoaderButton {
            static let cornerRadius = 5.0
            static let height = 40.0
            static let id = 6
        }
    }
}
