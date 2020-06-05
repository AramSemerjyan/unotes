//
//  AllNotesVC.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import RealmSwift

class AllNotes: UIViewController {

    private lazy var _viewModel: IAllNotesViewModel = {
        AllNotesViewModel(view: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        _viewModel.fetchNotes()
    }
}

extension AllNotes: IAllNoteViewModelEvents {
    func fetchedNotes(_ notes: [INote]) {

    }
}
