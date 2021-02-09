//
//  LoginCoordinator.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import Foundation
import Swinject

class LoginCoordinator: Coordinator {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    weak var delegate: CoordinatorDelegate?
    var children: [Coordinator] = []
    
    
    // MARK: Private
    private let navigationController: AppNavigationController
    
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    init(navigationController: AppNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = LoginVM(resolver: AppContainer.sharedResolver)
        vm.flowDelegate = self
        let vc = LoginVC(viewModel: vm)
        navigationController.viewControllers = [vc]
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: Public
    
    
    // MARK: Private
    
    
}

extension LoginCoordinator: BaseFlowDelegate {
    func backTap(_ vc: UIViewController) {
        delegate?.ended(coordinator: self)
    }
}

extension LoginCoordinator: LoginFlowDelegate {
    
}
