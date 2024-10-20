//
//  SOSIntroductionForm.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 13/10/2024.
//

import SwiftUI
import SmartProtectionUI

struct SOSIntroductionForm: View {
    // MARK: - Environment Objects
    
    @EnvironmentObject var router: Router
    @Binding private var isPresented: Bool
    
    // MARK: - Initializers
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    // MARK: - UI
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                sosSwitcher
            }
        }
        .scrollIndicators(.hidden)
    }
    
    var headerView: some View {
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
            Text("SOS_INTRODUCTION_FORM_SUBTITLE".localized)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.bottom)
    }
    
    private var sosSwitcher: some View {
        HStack(spacing: Constants.SwitcherButton.spacing) {
            propertyFormButton
            firstAidFormButton
        }
    }
    
    private var propertyFormButton: some View {
        Button {
            router.navigateTo(.sosPropertyForm)
        } label: {
            VStack {
                buttonBackground
                    .overlay {
                        Image(systemName: "house.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(
                                width: Constants.SwitcherButton.Icon.width,
                                height: Constants.SwitcherButton.Icon.height
                            )
                    }
                Text("SOS_INTRODUCTION_FORM_PROPERTY".localized)
                    .font(.custom(
                        Constants.SwitcherButton.Font.fontMedium,
                        size: Constants.SwitcherButton.Font.small)
                    )
                    .foregroundColor(.black)
            }
        }
    }
    
    private var firstAidFormButton: some View {
        Button {
            router.navigateTo(.sosFirstAidForm)
        } label: {
            VStack {
                buttonBackground
                    .overlay {
                        Image(systemName: "cross.case.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(
                                width: Constants.SwitcherButton.Icon.width,
                                height: Constants.SwitcherButton.Icon.height
                            )
                    }
                Text("SOS_INTRODUCTION_FORM_HUMAN".localized)
                    .font(.custom(
                        Constants.SwitcherButton.Font.fontMedium,
                        size: Constants.SwitcherButton.Font.small)
                    )
                    .foregroundColor(.black)
            }
        }
    }
    
    private var buttonBackground: some View {
        RoundedRectangle(cornerRadius: Constants.SwitcherButton.radius)
            .frame(width: Constants.SwitcherButton.width, height: Constants.SwitcherButton.height)
            .foregroundColor(.spBlue)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Cancel Button
        struct CancelButton {
            static let width: CGFloat = 20
            static let height: CGFloat = 20
        }
        
        /// Switcher Button
        struct SwitcherButton {
            static let width: CGFloat = 150
            static let height: CGFloat = 125
            static let radius: CGFloat = 5
            static let spacing: CGFloat = 15
            
            /// Icon
            struct Icon {
                static let width: CGFloat = 45
                static let height: CGFloat = 45
            }
            
            /// Font
            struct Font {
                static let fontMedium = "Avenir Next Medium"
                static let small = 10.0
            }
        }
    }
}
