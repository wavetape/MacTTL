//
//  test.swift
//  MacTTL
//
//  Created by WaveTape on 31.03.2022.
//

import Foundation

public func getCurrentTTL() -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", "sysctl net.inet.ip.ttl"]
    task.launchPath = "/bin/zsh"
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let preoutput = String(data: data, encoding: .utf8)!
    let output = preoutput.components(separatedBy: .whitespaces)[1]
    
    return output
}

func ttlChange(ttl: String) {
    
    let myAppleScript = "do shell script \"sudo sysctl -n net.inet.ip.ttl=" + ttl + "\" with administrator privileges"
    var error: NSDictionary?
    let scriptObject = NSAppleScript(source: myAppleScript)!
    scriptObject.executeAndReturnError(&error)
}
