//
//  AppCoordinator.swift
//
//  Created by Fabio Butti on 11/05/2020.
//  Copyright © 2020 Tiknil. All rights reserved.
//

import Swinject
import RxSwift
import IQKeyboardManager

class AppCoordinator: Coordinator {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    var children: [Coordinator] = []
    
    
    // MARK: Private
    private let disposeBag = DisposeBag()
    private let window: UIWindow
    private let navigationController = AppNavigationController()
    private var unauthorizedNotificationObserver: NSObjectProtocol?

//    lazy var popupManager: PopupManagerProtocol = {
//        return AppContainer.sharedResolver.resolve(PopupManagerProtocol.self)!
//    }()
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        
        // Se un'API ritorna unauthorized significa che il token è stato invalidato, quindi viene forzato il logout
//        unauthorizedNotificationObserver = NotificationCenter.default.addObserver(forName: .unauthorized, object: nil, queue: OperationQueue.main) { [weak self] _ in
//            self?.dataService.set(appToken: nil)
//            self?.start()
//        }
    }
    
    deinit {
        if let notification = unauthorizedNotificationObserver {
            NotificationCenter.default.removeObserver(notification)
        }
    }
    
    
    // MARK: Public
    func start() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.delegate = self
        addAndStart(child: loginCoordinator)
    }
    
    
    // MARK: Private
}

// MARK: - CoordinatorDelegate
extension AppCoordinator: CoordinatorDelegate {
    func ended(coordinator: Coordinator) {
        ended(coordinator: coordinator, with: nil)
    }
    
    func ended(coordinator: Coordinator, with data: Any?) {
        remove(child: coordinator)
        switch coordinator {
        default:
            break
        }
    }
}
