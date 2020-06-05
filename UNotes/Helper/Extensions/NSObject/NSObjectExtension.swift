//
//  NSObjectExtension.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

extension NSObject {
    static var name: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
