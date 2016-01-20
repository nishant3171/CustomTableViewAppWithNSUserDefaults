//
//  CustomizedCell.swift
//  Dirty Neighbours
//
//  Created by nishant punia on 19/01/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import UIKit

class CustomizedCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
    }
    
    func customizeCell(post: TableLayout) {
       
        titleLabel.text = post.title
        descLabel.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.dirtyImgAddress)
    }

  

}
