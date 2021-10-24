//
//  ClassOfString.swift
//  ReversWordTest
//
//  Created by Andrey Boyko on 26.09.2021.
//
import Foundation
import UIKit

class ClassOfString {
    
    var userString: String
    var reverseString: String = ""
    var userAn: String = "xl"
    var newUserString: String = ""
    
    init(userString: String, reverseString: String?) {
        self.userString = userString
        self.newUserString = anExeption(text: userString, textAn: userAn)
        self.reverseString = reversText(text: self.newUserString)
    }
    
    func anExeption (text: String, textAn: String) -> String {
        let newString = textAn.reversed()
        let str = text
        let regex = try! NSRegularExpression(pattern: textAn, options: [])
        let output = regex.stringByReplacingMatches(
            in: str,
            options: [],
            range: NSRange(location: 0, length: str.count),
            withTemplate: String(newString)
        )
        
        return output
    }
    
    func reversText (text: String) -> String {
        
        let reverseText = text.split(separator: " ").map {
            guard $0 != userAn else { return String($0) }
            return String($0.reversed())
        }.joined(separator: " ")
        return reverseText
        
    }
}




