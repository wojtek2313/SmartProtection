//
//  SPCardView.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 27/07/2024.
//

import SwiftUI

public struct SPCardView: View {
    // MARK: - Private Properties
    
    private var cardId: String
    private var avatar: Image
    private var name: String
    private var surname: String
    private var company: String
    
    @State private var isAnonimized = false
    
    // MARK: - Initializers
    
    public init(cardId: String, avatar: Image? = nil, name: String, surname: String, company: String) {
        self.cardId = cardId
        self.avatar = avatar ?? Image(systemName: Constants.Image.systemName)
        self.name = name
        self.surname = surname
        self.company = company
    }
    
    // MARK: - UI
    
    public var body: some View {
        ZStack {
            base.overlay { cardContent }
            base.opacity(isAnonimized ? 1 : 0)
        }
        .rotation3DEffect(
            .degrees(
                isAnonimized ? Constants.Animation3D.maxDegrees : Constants.Animation3D.minDegrees
            ),
            axis: (x: 0, y: 1, z: 0)
        )
        .onLongPressGesture() {
            withAnimation(.easeInOut(duration: Constants.Animation3D.duration)) {
                isAnonimized.toggle()
            }
        }
    }
    
    private var base: some View {
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
    
    private var cardContent: some View {
        VStack {
            avatarImage
                .padding(.top)
            userData
                .padding(.bottom)
        }
    }
    
    private var avatarImage: some View {
        avatar
            .resizable()
            .scaledToFit()
            .frame(width: Constants.Image.width, height: Constants.Image.height)
            .foregroundColor(.white)
            .background(.gray)
            .clipShape(Circle())
    }
    
    private var userData: some View {
        VStack {
            Text("\(name) \(surname)")
                .font(.custom(Constants.Font.font, fixedSize: Constants.Font.size))
            Text("SP_CARD_VIEW_ID".localized + " \(cardId)")
                .font(.custom(Constants.Font.fontMedium, fixedSize: Constants.Font.small))
            Text("SP_CARD_VIEW_COMPANY".localized + " \(company)")
                .font(.custom(Constants.Font.fontMedium, fixedSize: Constants.Font.small))
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Rounded Rectangle
        struct RoundedRectangle {
            static let cornerRadius: CGFloat = 8
            static let minHeight: CGFloat = 189
            static let idealHeight: CGFloat = 189
            static let maxHeight: CGFloat = 190
            static let radius: CGFloat = 4
            static let y: CGFloat = 2
        }
        
        /// Animation 3D
        struct Animation3D {
            static let maxDegrees: CGFloat = 180
            static let minDegrees: CGFloat = 0
            static let duration = 1.5
        }
        
        /// Image
        struct Image {
            static let systemName = "person.fill.badge.plus"
            static let width: CGFloat = 80
            static let height: CGFloat = 80
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
