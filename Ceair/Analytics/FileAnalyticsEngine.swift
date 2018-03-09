//
//  FileSystemAnalyticsEngine.swift
//  Ceair
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

class FileAnalyticsEngine: AnalyticsEngine {
    
    func sendAnalyticsEvent(named name: String, metadata: [String : String]) {
        let fileURL = getLogFileURL()
        print(fileURL.path)
        do {
            print("Before log: \(getFileSize(atPath: fileURL.path))")
//            try name.write(to: fileURL, atomically: true, encoding: .utf8)
            try appendLog(name, toURL: fileURL)
            print("After log: \(getFileSize(atPath: fileURL.path))")

        } catch {
            print("File log error: \(error.localizedDescription)")
        }
    }
    
    func appendLog(_ content: String, toURL fileURL: URL) throws {
        try content.appendLineToURL(fileURL: fileURL)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func getLogFileURL() -> URL {
        let directory = getDocumentsDirectory()
        
        let logA = directory.appendingPathComponent("AnalyticsLogA.txt")
        let logB = directory.appendingPathComponent("AnalyticsLogB.txt")
        
        if FileManager.default.fileExists(atPath: logA.path) {
            print("Has LogA")
        } else {
            let startDate = "\(Date())"
            do {
                try startDate.write(to: logA, atomically: true, encoding: .utf8)
            } catch {
                fatalError("Can't write to log file, error: \(error.localizedDescription)")
            }
            print("No LogA")
        }
        
        if FileManager.default.fileExists(atPath: logB.path) {
            print("Has LogB")
        } else {
            let startDate = "\(Date())"
            do {
                try startDate.write(to: logB, atomically: true, encoding: .utf8)
            } catch {
                fatalError("Can't write to log file, error: \(error.localizedDescription)")
            }
            print("No LogB")
        }
        
        return logA
    }
    
    func getFileSize(atPath filePath: String) -> UInt64 {
        do {
            let attributes = try FileManager.default.attributesOfItem(atPath: filePath)
            return attributes[FileAttributeKey.size] as! UInt64
        } catch {
            print("File log error: \(error.localizedDescription)")
        }
        return 0
    }
    
}

extension String {
    func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }
    
    func appendToURL(fileURL: URL) throws {
        let data = self.data(using: .utf8)!
        try data.append(fileURL: fileURL)
    }
}

extension Data {
    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        } else {
            try write(to: fileURL, options: .atomic)
        }
    }
}
