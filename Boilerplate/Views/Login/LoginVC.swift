//
//  LoginVC.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LoginVC: BaseVC {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    let viewModel: LoginVM
    
    // MARK: Private
    private let titleLbl = UILabel()
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("must be initialized from init(viewModel:)")
    }
    
    init(viewModel: LoginVM) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func setupUi() {
        super.setupUi()
        
        titleLbl.text = "Login"
        titleLbl.textAlignment = .center
        titleLbl.textColor = .white
        
        
        view.addSubview(titleLbl)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        titleLbl.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.hPadding16)
        }
    }
    
    override func setupBindings() {
        super.setupBindings()
    }
    
    // MARK: Public
    
    
    // MARK: Private
    
    
}
