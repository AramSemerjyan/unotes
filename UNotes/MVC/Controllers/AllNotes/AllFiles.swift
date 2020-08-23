//
//  AllNotesVC.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import RealmSwift

class AllFiles: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var files: [IFile] = []

    private lazy var _viewModel: IAllFilesViewModel = {
        AllFilesViewModel(view: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        _viewModel.fetchNotes()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            UINib(nibName: "FileTableViewCell", bundle: nil),
            forCellReuseIdentifier: "FileCell")
    }
}

extension AllFiles: IAllFilesViewModelEvents {
    func fetchedNotes(_ files: [IFile]) {
        print(files.map { $0.size })
        self.files = files

        self.tableView.reloadData()
    }
}

extension AllFiles: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        files.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell") as? FileTableViewCell else { return UITableViewCell() }

        cell.setUp(with: files[indexPath.row])

        return cell
    }
}
