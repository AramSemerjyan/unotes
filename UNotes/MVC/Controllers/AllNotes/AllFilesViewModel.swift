//
//  AllNotesViewModel.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol IAllFilesViewModel: class {
    func fetchNotes()
}

protocol IAllFilesViewModelEvents: class {
    func fetchedNotes(_ files: [IFile])
}

class AllFilesViewModel {

    private var _notesDataStore: NotesDataStore

    weak var delegate: IAllFilesViewModelEvents?

    init(
        view: IAllFilesViewModelEvents,
        notesDataStore: NotesDataStore = NotesDS(RealmManager.shared)
    ) {
        self._notesDataStore = notesDataStore

        self.delegate = view
    }
}

extension AllFilesViewModel: IAllFilesViewModel {
    func fetchNotes() {
        let files: [IFile] = [
            TextFile(),
            AudioFile(),
            Folder([TextFile(), AudioFile(), AudioFile(), AudioFile()])
        ]

        self.delegate?.fetchedNotes(files)
    }
}
