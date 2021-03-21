//
//  CTText.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() {}

    @UserDefault(UserDefaultKey.firstStart, default: true)  var firstStart: Bool
    @UserDefault(UserDefaultKey.token, default: "")  var token: String
    @UserDefault(UserDefaultKey.user_uuid, default: "")  var user_uuid: String
    @UserDefault(UserDefaultKey.company_uid, default: "")  var company_uid: String
    @UserDefault(UserDefaultKey.user_interests, default: [])  var user_interests: [String]
}


@propertyWrapper
struct UserDefault<T> where T: Codable {
    
    let key: UserDefaultKey
    let defaultValue: T
    
    init(_ key: UserDefaultKey, default: T) {
        self.key = key
        self.defaultValue = `default`
    }

    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}


struct UserDefaultKey: RawRepresentable {
    
    let rawValue: String
}


extension UserDefaultKey: ExpressibleByStringLiteral {
    
    init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}


extension UserDefaultKey {
    
    typealias Key = UserDefaultKey
    
    static let firstStart: Key  = "firstStart"
    static let token: Key       = "token"
    static let user_uuid: Key   = "user_uuid"
    static let company_uid: Key = "company_uid"
    static let user_interests: Key = "user_interests"
}
