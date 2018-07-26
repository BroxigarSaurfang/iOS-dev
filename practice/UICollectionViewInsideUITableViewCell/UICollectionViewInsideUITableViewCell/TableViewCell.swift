//
//  TableViewCell.swift
//  UICollectionViewInsideUITableViewCell
//
//  Created by ASURADA on 2018. 5. 17..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    // - MARK: IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // - MARK: Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
