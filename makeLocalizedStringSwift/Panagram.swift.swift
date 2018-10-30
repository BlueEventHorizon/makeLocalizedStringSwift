//
//  Panagram.swift.swift
//  makeLocalizedStringSwift
//
//  Created by Katsuhiko Terada on 2018/07/09.
//  Copyright © 2018年 Katsuhiko Terada. All rights reserved.
//

import Foundation

class Panagram
{
    let consoleIO = ConsoleIO()
    var input1: String?
    var input2: String?
    
    func staticMode()
    {
        let argc = Int(CommandLine.argc)
        if argc > 1
        {
            input1 = CommandLine.arguments[1]
        }
        if argc > 2
        {
            input2 = CommandLine.arguments[2]
        }
    }
    
    func read()
    {
        if let _input1 = input1, let _input2 = input2
        {
            var lines1: [String] = [String]()
            var lines2: [String] = [String]()
            
            let path1: String = "./" + _input1
            if let text = try? String(contentsOfFile: path1, encoding: String.Encoding.utf8) {
                lines1 = text.components(separatedBy: "\n")
            }
            
            let path2: String = "./" + _input2
            if let text = try? String(contentsOfFile: path2, encoding: String.Encoding.utf8) {
                lines2 = text.components(separatedBy: "\n")
            }
            
            for line1 in lines1
            {
                let split = line1.components(separatedBy: "\"")
                if split.count > 1
                {
                    var line22: String?
                    let key1 = split[1]
                    for line2 in lines2
                    {
                        let split2 = line2.components(separatedBy: "\"")
                        if split2.count > 1
                        {
                            let key2 = split2[1]
                            if key1 == key2
                            {
                                line22 = line2
                                break
                            }
                        }
                    }
                    if let _line22 = line22
                    {
                        print(_line22)
                    }
                    else
                    {
                        print(line1)
                    }
                }
                else
                {
                    print(line1)
                }
            }
//
//            print(lines1)
//            print(lines2)
        }
    }
    
    func interactiveMode() {

        var shouldQuit = false
        while !shouldQuit {
            let line = consoleIO.getInput()
            if line.isEmpty
            {
                shouldQuit = true
                continue
            }
            else
            {
                
            }
            print(line)
        }
    }
}
