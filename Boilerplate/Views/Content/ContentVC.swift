//
//  ContentVC.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ContentVC: BaseVC {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    let viewModel: ContentVM
    
    // MARK: Private
    private let label = UILabel()
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("must be initialized from init(viewModel:)")
    }
    
    init(viewModel: ContentVM) {
        self.viewModel = viewModel
        super.init()
        
        
        
    }
    
    override func setupUi() {
        super.setupUi()
        
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    override func setupBindings() {
        super.setupBindings()
    }
    
    
    // MARK: Public
    
    
    // MARK: Private
    

}
