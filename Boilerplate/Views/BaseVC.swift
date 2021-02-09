//
//  BaseVC.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import UIKit
import RxSwift
import RxCocoa
import Lottie

class BaseVC: UIViewController {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    
    
    // MARK: Private
    
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        setupConstraints()
        setupBindings()
    }
    
    deinit {
        log("[DEINIT] \(String(describing: type(of: self)))")
    }
    
    // MARK: Public
    // Metodo da sovrascrivere nelle classi figlie per l'inizializzazione della UI
    func setupUi() {
    
    }
    
    // Metodo da sovrascrivere nelle classi figlie per l'inizializzazione delle constraints
    func setupConstraints() {
        
    }
    
    // Metodo da sovrascrivere nelle classi figlie per l'inizializzazione della binding
    func setupBindings() {
        
    }
    
    
    // MARK: Private
    
    
}
