//
//  BaseVM.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import Foundation
import RxSwift
import RxCocoa
import Swinject

protocol BaseFlowDelegate: class {
    func backTap(_ vc: UIViewController)
}

class BaseVM {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    public let disposeBag = DisposeBag()
    
    // Services
    let resolver: Resolver
    
    
    // MARK: Private
    
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    init(resolver: Resolver) {
        self.resolver = resolver
        
    }
    
    deinit {
        log("[DEINIT] \(String(describing: type(of: self)))")
    }
    
    // MARK: Public
    
    
    // MARK: Private
    
    
}
