//
//  TableViewCell.swift
//  ToDo
//
//  Created by Ivan Costa on 02/07/20.
//  Copyright © 2020 Ivan Costa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with task: Array<String>) {
        lbTitle.text = task[0]
    }

}
