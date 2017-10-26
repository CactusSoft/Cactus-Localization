//
//  LocalizedString.swift
//  LocalizedString
//
//  Created by Ivan Sobolevskiy on 10/2/17.
//  Copyright © 2017 Ivan Sobolevskiy. All rights reserved.
//

import Foundation

fileprivate struct BaseConstants {
    
    static let baseResource = "Base"
    static let baseType = "lproj"
    
    private init() {}
}

public extension String {
    /**
     Returns localized version of string by key. Falls back first to the Base.lproj, then to the provided `value`.
     'Key' on which this function is called cannot be empty.
     
     */
    func localized(tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "", comment: String? = nil) -> String {
        let key = self
        return localize(with: key, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
    
    /**
     Localized string by key. Falls back first to the Base.lproj, then to the provided `value`.
     'Key' on which this function is called cannot be empty.
     
     */
    mutating func localize(tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "", comment: String? = nil) {
        let key = self
        self = localize(with: key, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
    
    private func localize(with key: String, tableName: String?, bundle: Bundle, value: String, comment: String?) -> String {
        assert(!key.isEmpty, "'Key' should not be empty")
        var translated: String? = bundle.localizedString(forKey: key, value: value, table: tableName)
        let shouldLookInBase = translated == key || translated == value
        
        if shouldLookInBase {
            if let baseLprojPath = bundle.path(forResource: BaseConstants.baseResource, ofType: BaseConstants.baseType) {
                translated = Bundle(path: baseLprojPath)?.localizedString(forKey: key, value: value, table: tableName)
            }
        }
        
        guard let newValue = translated else { return key }
        return newValue
    }
}
