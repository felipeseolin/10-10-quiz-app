//
//  QuizTableViewCell.swift
//  quiz-meme
//
//  Created by Felipe Seolin Bento on 01/08/21.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var level: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
