//
//  CategoryCollectionViewCell.swift
//  Task
//
//  Created by Osama Walid on 15/05/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    override var isSelected: Bool {
        didSet {
            self.cellBackground.backgroundColor = isSelected ? UIColor.lightBlue : UIColor.secondary
        }
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackground.layer.cornerRadius = 12
        // Initialization code
    }
    
    func setUpCellContent(title:String){
        categoryTitle.text = title
    }

}
