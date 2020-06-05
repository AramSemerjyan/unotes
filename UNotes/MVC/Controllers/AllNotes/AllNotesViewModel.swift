//
//  AllNotesViewModel.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol IAllNotesViewModel: class {
    func fetchNotes()
}

protocol IAllNoteViewModelEvents: class {
    func fetchedNotes(_ notes: [INote])
}

class AllNotesViewModel {

    private var _notesDataStore: NotesDataStore

    weak var delegate: IAllNoteViewModelEvents?

    init(
        view: IAllNoteViewModelEvents,
        notesDataStore: NotesDataStore = NotesDS(RealmManager.shared)
    ) {
        self._notesDataStore = notesDataStore

        self.delegate = view
    }
}

extension AllNotesViewModel: IAllNotesViewModel {
    func fetchNotes() {
        let notes = _notesDataStore.fetchAllNotes()

        self.delegate?.fetchedNotes(notes)
    }
}
