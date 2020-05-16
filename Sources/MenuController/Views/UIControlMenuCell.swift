//
//  UIControlMenuCell.swift
//  Menu Conroller
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

class UIControlMenuCell:UITableViewCell {
    // MARK: view data
    struct Parameters:Equatable {
        let title:String
        let image:UIImage
    }
    var parameters: Parameters? {
        didSet {
            if oldValue != parameters {
                updateContents(resetExisting: true)
            }
        }
    }
    private func updateContents(resetExisting: Bool = false) {
        queue.cancelAllOperations()
        
        if resetExisting || parameters == nil {
            setupData(parameters: nil, animated: false)
        }
        
        guard let parameters = parameters else { return }
        let operation = BlockOperation()
        
        operation.addExecutionBlock() { [weak self, weak operation] in
            guard let self = self, let operation = operation, !operation.isCancelled else {
                return
            }
            DispatchQueue.main.async() {
                guard !operation.isCancelled else { return }
                
                self.setupData(parameters: parameters, animated: true)
            }
        }
        queue.addOperation(operation)
    }
    private func setupData(parameters:Parameters?, animated:Bool) {
        titleLabel.text = parameters?.title
        iconImageView.image = parameters?.image.withTintColor(.white).withRenderingMode(.alwaysOriginal)
    }
    
    
    
    //MARK: Common init
    private func commonInit() {
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)

        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
                
        // MARK: icon image view
        contentView.addSubview(iconImageView)
        iconImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 23).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 23).isActive = true
    }
    
    
    // MARK: Constructors
    private let queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.qualityOfService = .userInteractive
        return queue
    }()
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    private lazy var iconImageView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    
    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContents()
    }
}
