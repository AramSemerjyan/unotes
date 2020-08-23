//
//  RealmNotes.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import RealmSwift

class RealmNote: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String?
    @objc dynamic var desc: String?

    override static func primaryKey() -> String? {
      return "id"
    }

    init(_ note: ITextNote) {
        guard let id = note.id else { return }

        self.id = id
        self.title = note.title
        self.desc = note.desc
    }

    required init() {
        super.init()
    }
}
