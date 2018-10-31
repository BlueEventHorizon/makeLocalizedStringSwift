//
//  ConsoleIO.swift.swift
//  makeLocalizedStringSwift
//
//  Created by Katsuhiko Terada on 2018/07/09.
//  Copyright © 2018年 Katsuhiko Terada. All rights reserved.
//

import Foundation

class ConsoleIO
{
    func print_err(_ message: String)
    {
        fputs("Error: \(message)\n", stderr)
    }
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}



