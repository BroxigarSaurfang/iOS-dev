//
//  CheckListCell.swift
//  TableViewBeta
//
//  Created by ASURADA on 2018. 4. 27..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class CheckListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
