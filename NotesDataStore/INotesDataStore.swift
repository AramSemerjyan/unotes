//
//  INotesDataStore.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/6/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol NotesDataStoreRead {
    func fetchAllNotes() -> [ITextNote]
}

protocol NotesDataStoreWrite {
    func addNote(_ note: ITextNote)
    func updateNote(_ note: ITextNote)
}

protocol NotesDataStore: NotesDataStoreRead, NotesDataStoreWrite { }
