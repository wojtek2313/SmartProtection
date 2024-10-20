//
//  SOSView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 10/10/2024.
//

import SwiftUI
import SmartProtectionUI

struct SOSView: View {
    // MARK: - Private Properties
    
    private var dependencyFactory: DependenciesFacotry
    private let sosFormFactory: SOSFormFactoryProtocol
    
    private let proxy: GeometryProxy
    
    @Binding private var isPresented: Bool
    @State private var isFormDisplayed = false
    
    // MARK: - Initializers
    
    init(
        isPresented: Binding<Bool>,
        proxy: GeometryProxy,
        dependencyFactory: DependenciesFacotry,
        sosFormFactory: SOSFormFactoryProtocol = SOSFormFactory()
    ) {
        self.dependencyFactory = dependencyFactory
        self.proxy = proxy
        self._isPresented = isPresented
        self.sosFormFactory = sosFormFactory
    }
    
    // MARK: - UI
    
    @ViewBuilder
    var body: some View {
        if isFormDisplayed {
            sosFormView
                .frame(height: proxy.size.height - Constants.SOS.headerHeight)
        } else {
            sosInitView
        }
    }
    
    private var sosFormView: some View {
        sosFormFactory.createSOSForm(isPresented: $isPresented, dependencyFactory: dependencyFactory)
    }
    
    private var sosInitView: some View {
        VStack {
            header
            sosButtonsStack
        }
    }
    
    private var header: some View {
        VStack {
            closeButton
            title
            subtitle
        }
        .padding()
    }
    
    private var closeButton: some View {
        HStack {
            Spacer()
            Button { isPresented = false } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(
                        width: Constants.CancelButton.width,
                        height: Constants.CancelButton.height
                    )
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var title: some View {
        HStack {
            Text("SOS_MAIN_TITLE".localized)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.red)
            Spacer()
        }
        .padding(.bottom)
    }
    
    private var subtitle: some View {
        HStack {
            Text("SOS_SUBTITLE".localized)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
    }
    
    private var sosButtonsStack: some View {
        HStack {
            goToSOSFormButton
            sosCallButton
        }
    }
    
    private var sosCallButton: some View {
        Button {} label: {
            Image(systemName: "phone.circle.fill")
                .resizable()
                .frame(width: Constants.Image.width,
                       height: Constants.Image.height,
                       alignment: .center)
                .foregroundColor(.red)
        }
        .padding(.trailing)
    }
    
    private var goToSOSFormButton: some View {
        SPButton(
            type: .sosForm,
            height: Constants.Button.height,
            titleFont: .largeTitle,
            cornerRadius: Constants.Button.cornerRadius,
            isFlat: true
        ) {
            isFormDisplayed = true
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Image
        struct Image {
            static let width: CGFloat = 60
            static let height: CGFloat = 60
        }
        
        /// Button
        struct Button {
            static let height: CGFloat = 60
            static let cornerRadius: CGFloat = 30
        }
        
        /// Cancel Button
        struct CancelButton {
            static let width: CGFloat = 20
            static let height: CGFloat = 20
        }
        
        /// Shadow
        struct Shadow {
            static let radius = 3.0
            static let xPosition = 0.0
            static let yPosition = 1.0
        }
        
        /// SOS
        struct SOS {
            static let headerHeight: CGFloat = 100
        }
    }
}
