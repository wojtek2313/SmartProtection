//
//  UserDto.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 18/07/2024.
//

import Foundation

public struct UserDto {
    public var name: String
    public var surname: String
    public var company: String
    public var mobile: String
    public var mail: String
    public var password: String
}

extension Welcome.User {
    public var toDTO: UserDto? {
        guard let name = name,
              let surname = surname,
              let company = company,
              let mobile = mobile,
              let mail = mail,
              let password = password else { return nil }
        
        return UserDto(name: name,
                surname: surname,
                company: company,
                mobile: mobile,
                mail: mail,
                password: password)
    }
}
