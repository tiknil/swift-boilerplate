//
//  AppNavigatorController.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import UIKit
import SnapKit

class AppNavigationController: UINavigationController {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    var statusBarStyle: UIStatusBarStyle = .lightContent {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: Private
    
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    // MARK: Public
    
    
    // MARK: Private
    
    
}
