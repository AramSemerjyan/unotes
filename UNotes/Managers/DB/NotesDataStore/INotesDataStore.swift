//
//  INotesDataStore.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/6/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol NotesDataStoreRead {
    func fetchAllNotes() -> [INote]
}

protocol NotesDataStoreWrite {
    func addNote(_ note: INote)
    func updateNote(_ note: INote)
}

protocol NotesDataStore: NotesDataStoreRead, NotesDataStoreWrite { }
