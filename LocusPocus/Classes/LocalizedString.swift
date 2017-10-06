//
//  LocalizedString.swift
//  LocalizedString
//
//  Created by Ivan Sobolevskiy on 10/2/17.
//  Copyright © 2017 Ivan Sobolevskiy. All rights reserved.
//

import Foundation

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
        assert(!key.isEmpty, "Empty `key` is meaningless.")
        var translated: String? = bundle.localizedString(forKey: key, value: value, table: tableName)
        
        if translated == key || translated == value {
            if let baseLprojPath = bundle.path(forResource: "Base", ofType: "lproj") {
                translated = Bundle(path: baseLprojPath)?.localizedString(forKey: key, value: value, table: tableName)
            }
        }
        
        guard translated != nil && translated! != key else { return key }
        return translated!
    }
}
