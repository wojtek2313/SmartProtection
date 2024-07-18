//
//  UserDto.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 18/07/2024.
//

import Foundation

struct UserDto {
    var name: String
    var surname: String
    var company: String
    var mobile: String
    var mail: String
    var password: String
}

extension Welcome.User {
    var toDTO: UserDto? {
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
