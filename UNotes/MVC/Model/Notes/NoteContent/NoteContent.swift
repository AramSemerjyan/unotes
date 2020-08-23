//
//  NoteContent.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/6/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol INoteContent {
    var id: String { get }
    var data: Data { get }
}
