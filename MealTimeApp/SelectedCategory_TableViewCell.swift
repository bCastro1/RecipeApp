//
//  SelectedCategory_TableViewCell.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

class SelectedCategory_TableViewCell: UITableViewCell {
    private let cellConstraintPadding: CGFloat = 8
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: UI components
    var mealTitle: UILabel = {
        var label = UILabel.standard(withText: "")
        return label
    }()
    
    func setCellConstraints(){
        self.addSubview(mealTitle)
        mealTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: cellConstraintPadding).isActive = true
        mealTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*cellConstraintPadding).isActive = true
        mealTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: cellConstraintPadding).isActive = true
        mealTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: cellConstraintPadding).isActive = true
    }
}
