//
//  FolderTableViewCell.swift
//  UNotes
//
//  Created by Aram Semerjyan on 8/23/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var filesCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        initialSetUp()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        initialSetUp()
    }

    func initialSetUp() {
        filesCount.isHidden = true
        iconImageView.image = nil
        titleLabel.text = ""
        sizeLabel.text = ""

        self.accessoryType = .none
    }

    func setUp(with file: IFile) {

        if let image = UIImage(named: file.icon) {
            iconImageView.image = image
        }

        titleLabel.text = file.title
        sizeLabel.text = file.size.getReadableUnit()

        if let folder = file as? Folder {
            filesCount.isHidden = false
            filesCount.text = folder.files.count.toString()

            self.accessoryType = .disclosureIndicator
        }
    }
}
