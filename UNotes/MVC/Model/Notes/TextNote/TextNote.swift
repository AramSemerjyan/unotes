//
//  Note.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol ITextNote {
    var id: String? { get }
    var title: String? { get set }
    var desc: String? { get set }
}

struct TextNoteStruct {
    var id: String?

    var title: String? = nil
    var desc: String? = nil
}

extension TextNoteStruct: ITextNote { }

extension TextNoteStruct {
    init(_ realmNote: RealmNote) {
        id = realmNote.id
        title = realmNote.title
        desc = realmNote.desc
    }
}
