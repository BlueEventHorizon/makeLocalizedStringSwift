//
//  PatchStrings.swift
//  makeLocalizedStringSwift
//
//  Created by Katsuhiko Terada on 2018/07/09.
//  Copyright © 2018年 Katsuhiko Terada. All rights reserved.
//

import Foundation

class PatchStrings
{
    let consoleIO = ConsoleIO()
    var input1: String?
    var input2: String?
    
    func staticMode()
    {
        let argc = Int(CommandLine.argc)
        
        guard argc > 2 else
        {
            usage()
            return
        }
        input1 = CommandLine.arguments[1]
        input2 = CommandLine.arguments[2]
    }
    
    
    func usage() {
        
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        print("usage:")
        print("\(executableName) Localizable.strings patchfile > Localizable.strings.new")
    }
    
    func patch()
    {
        if let _input1 = input1, let _input2 = input2
        {
            var originals: [String] = [String]()
            var updates: [String] = [String]()
            
            let path1: String = "./" + _input1
            if let text = try? String(contentsOfFile: path1, encoding: String.Encoding.utf8) {
                originals = text.components(separatedBy: "\n") // 各行の配列にする
            }
            
            let path2: String = "./" + _input2
            if let text = try? String(contentsOfFile: path2, encoding: String.Encoding.utf8) {
                updates = text.components(separatedBy: "\n") // 各行の配列にする
            }
            
            for original in originals
            {
                let split = original.components(separatedBy: "\"") // 行内を"で分割する
                if split.count > 1
                {
                    var foundWord: String?
                    let key1 = split[1] // ２つ目がKey
                    for updateWord in updates
                    {
                        let split2 = updateWord.components(separatedBy: "\"") // 行内を"で分割する
                        if split2.count > 1
                        {
                            let key2 = split2[1] // ２つ目がKey
                            if key1 == key2
                            {
                                foundWord = updateWord // 行を入れ替える
                                break
                            }
                        }
                    }
                    if let _foundWord = foundWord
                    {
                        print(_foundWord)
                    }
                    else
                    {
                        print(original)
                    }
                }
                else
                {
                    print(original) //
                }
            }
        }
    }
}
