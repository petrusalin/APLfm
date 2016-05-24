//
//  RequestSigning.swift
//  Pods
//
//  Created by Alin Petrus on 5/24/16.
//
//

import Foundation

protocol RequestSigning {
    func concatenateToString(destinationString: String, withKey key: String) -> String
}

extension String : RequestSigning {
    func concatenateToString(destinationString: String, withKey key: String) -> String {
        var string = destinationString
        string += key.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        if (LastfmKeys.keyRequiresUrlEncoding(key)) {
            string += self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        } else {
            string += self
        }
        
        return string
    }
    
}

extension Int : RequestSigning {
    func concatenateToString(destinationString: String, withKey key: String) -> String {
        var string = destinationString
        string += key.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        string += String(self)
        
        return string
    }
}

extension Array : RequestSigning {
    func concatenateToString(destinationString: String, withKey key: String) -> String {
        var string = destinationString
        var dict = [String : RequestSigning]()
        
        for (index, val) in self.enumerate() {
            if let value = val as? RequestSigning {
                let adjustedKey = "\(key)[\(index)]"
                dict[adjustedKey] = value
            }
        }
        
        let parameters = dict.keys
        let sortedParameters = parameters.sort () {$0 < $1}
        
        for key in sortedParameters {
            let value = dict[key]
            
            string = value!.concatenateToString(string, withKey: key)
        }
        
        
        
        return string
    }
}