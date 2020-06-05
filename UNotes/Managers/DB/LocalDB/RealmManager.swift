//
//  RealmManager.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager {

    private lazy var _realmQueue = {
        DispatchQueue.init(label: "realm_queue", qos: .userInteractive)
    }()

    private lazy var _realm: Realm = {
        let realm = try! Realm()

        return realm
    }()

    private init() {
        print(_realm.configuration.fileURL ?? "Can't find realm URL")
    }

    static let shared = RealmManager()

    func insertOrUpdate(_ obj: Object, callBack: ((Error?) -> Void)? = nil) {
        do {
            try _realm.write {
                _realm.add(obj, update: .modified)
                callBack?(nil)
            }
        } catch {
            print("REALM:: error on insertOrUpdate::", error.localizedDescription)
            callBack?(error)
        }
    }

    func delete(_ obj: Object, callBack: ((Error?) -> Void)? = nil) {
        do {
            try _realm.write {
                _realm.delete(obj)
                callBack?(nil)
            }
        } catch {
            print("REALM:: error on delete::", error.localizedDescription)
            callBack?(error)
        }
    }

    func get<T: Object>() -> Results<T> {
        _realm.objects(T.self)
    }
}
