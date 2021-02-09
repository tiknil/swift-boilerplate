//
//  LoginVM.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import Foundation
import RxSwift
import RxCocoa
import Swinject

protocol LoginFlowDelegate: BaseFlowDelegate {
    
}

class LoginVM: BaseVM {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    
    // Flow
    weak var flowDelegate: LoginFlowDelegate?
    
    // Outputs
    
    
    // Inputs
    
    // Bidirectionals
    
    
    // MARK: Private
    
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    override init(resolver: Resolver) {
        
        super.init(resolver: resolver)
        
        
    }
    
    // MARK: Public
    
    
    // MARK: Private
    
    
}
