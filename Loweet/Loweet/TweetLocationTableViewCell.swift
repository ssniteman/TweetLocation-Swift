//
//  TweetLocationTableViewCell.swift
//  Loweet
//
//  Created by Shane Sniteman on 9/15/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

import UIKit

class TweetLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBAction func editTweetLocation(sender: AnyObject) {
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
