//
//  EmptyStateView.swift
//  marvel
//
//  Created by Ana calvo on 31/5/22.
//

import UIKit

class EmptyStateView: UIView {
    
    // Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    func xibSetup() {
        self.view = loadViewFromNib()
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "EmptyStateView", bundle: bundle)
        let view = (nib.instantiate(withOwner: self, options: nil).first as? UIView)!
        return view
    }
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var mainImageView: UIImageView! {
        didSet {
            mainImageView.layer.cornerRadius = 5.0
            mainImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "There's nothing to see around here..."
        }
    }
    
    
}
