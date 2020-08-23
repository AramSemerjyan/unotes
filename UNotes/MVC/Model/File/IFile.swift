//
//  IFile.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/6/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol IFile {
    var size: Units { get }
    var title: String { get }
    var icon: String { get }
}

class AudioFile: IFile {
    var size: Units {
        Units(bytes: 1_572_864)
    }

    var title: String {
        "Audio"
    }

    var icon: String {
        FileImages.audio.rawValue
    }
}

class Folder: IFile {

    var size: Units { files.reduce(Units(bytes: 0)) { Units(bytes: $0.bytes + $1.size.bytes) } }

    var title: String { "Folder" }

    var icon: String { FileImages.folder.rawValue }

    let files: [IFile]

    init(_ files: [IFile]) {
        self.files = files
    }
}

class TextFile: IFile {
    var size: Units {
        Units(bytes: 2000)
    }

    var title: String {
        "Text"
    }

    var icon: String {
        FileImages.text.rawValue
    }
}
