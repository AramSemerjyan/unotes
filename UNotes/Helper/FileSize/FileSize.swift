//
//  FileSize.swift
//  UNotes
//
//  Created by Aram Semerjyan on 8/23/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

public struct Units {

    public let bytes: Int64

    public var kilobytes: Double {
        return Double(bytes) / 1_024
    }

    public var megabytes: Double {
        return kilobytes / 1_024
    }

    public var gigabytes: Double {
        return megabytes / 1_024
    }

    public init(bytes: Int64) {
        self.bytes = bytes
    }

    public func getReadableUnit() -> String {

        switch bytes {
        case 0..<1_024:
            return "\(bytes) bytes"
        case 1_024..<(1_024 * 1_024):
            return "\(getReadableString(kilobytes)) kb"
        case 1_024..<(1_024 * 1_024 * 1_024):
            return "\(getReadableString(megabytes)) mb"
        case (1_024 * 1_024 * 1_024)...Int64.max:
            return "\(getReadableString(gigabytes)) gb"
        default:
            return "\(bytes) bytes"
        }
    }

    private func getReadableString(_ value: Double) -> String {
        String(format: "%.2f", value)
    }
}
