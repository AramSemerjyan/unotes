//
//  NotesDataStore.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class NotesDS {

    private var _manager: RealmManager

    init(_ manager: RealmManager) {
        _manager = manager
    }
}

extension NotesDS: NotesDataStore { }

extension NotesDS: NotesDataStoreRead {
    func fetchAllNotes() -> [ITextNote] {
        let dbItems: [RealmNote] = Array(_manager.get())

        return dbItems.map { TextNoteStruct($0) }
    }
}

extension NotesDS: NotesDataStoreWrite {
    func addNote(_ note: ITextNote) {
        let rlmNote = RealmNote(note)
        _manager.insertOrUpdate(rlmNote)
    }

    func updateNote(_ note: ITextNote) {
        let rlmNote = RealmNote(note)
        _manager.insertOrUpdate(rlmNote)
    }
}
