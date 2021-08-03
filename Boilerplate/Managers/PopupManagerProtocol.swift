//
//  PopupManagerProtocol.swift
//  Moolti
//
//  Created by Riccardo Tribbia on 10/06/21.
//

import Foundation
import UIKit
import RxSwift

public typealias DismissAction = (_ finished:()) -> Void

protocol PopupManagerProtocol {
    // POPUP
    /// Popup customizzabile
    func showPopUp(title: String, body: String, defaultText: String?, cancelText: String?, defaultAction: DismissAction?, cancelAction: DismissAction?, navigationController: UINavigationController?)
    
    // LOADER
    func showLoader(message: String?, dismissText: String?, dismissHandler: DismissAction?, navigationController: UINavigationController?)
    func hideLoader()
    func isLoaderVisible() -> Bool
}

// Estensione per aggiungere il valori di default dei parametri
extension PopupManagerProtocol {
    func showPopUp(title: String, body: String, defaultText: String? = nil, cancelText: String? = nil, defaultAction: DismissAction? = nil, cancelAction: DismissAction? = nil, navigationController: UINavigationController? = nil) {
        showPopUp(title: title, body: body, defaultText: defaultText, cancelText: cancelText, defaultAction: defaultAction, cancelAction: cancelAction, navigationController: navigationController)
    }
    
    func showLoader(message: String? = nil, dismissText: String? = nil, dismissHandler: DismissAction? = nil, navigationController: UINavigationController? = nil) {
        showLoader(message: message, dismissText: dismissText, dismissHandler: dismissHandler, navigationController: navigationController)
    }
}
