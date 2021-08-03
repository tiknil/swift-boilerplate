//
//  PopupManager.swift
//  Moolti
//
//  Created by Riccardo Tribbia on 10/06/21.
//

import UIKit
import RxSwift

class PopupManager: PopupManagerProtocol {
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    
    
    // MARK: Private
    private var loader: UIAlertController?
    private var popup: UIAlertController?
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    
    
    // MARK: Public
    /**
     * Visualizza un popup con due pulsanti
     *
     * @param title: il titolo del popup
     * @param body: il messaggio del popup
     * @param defaultText: il testo del pulsante di conferma
     * @param cancelText: il testo del pulsante di cancellazione
     * @param defaultAction: il listener dei pulsante di default
     * @param cancelAction: il listener dei pulsante cancel
     * @param navigationController: eventuale navigation controller se non ci sono ancora view controller visibili quando si vuole mostrare il popup (utile per i check all'avvio)
     */
    func showPopUp(title: String,
                   body: String,
                   defaultText: String?,
                   cancelText: String?,
                   defaultAction: DismissAction?,
                   cancelAction: DismissAction?,
                   navigationController: UINavigationController?) {
        guard popup == nil else { return }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            let letsDoIt = { [weak self] in
                guard let self = self else { return }
                
                guard let referenceViewController = navigationController ?? UIApplication.shared.keyWindow?.visibleViewController, !(referenceViewController is UIAlertController) else {
                    log("😕 Nessun view controller o navigation controller visibile per la presentazione del popup")
                    return
                }
                
                self.popup = UIAlertController(title: title, message: body, preferredStyle: .alert)
                let effectiveDefaultAction = UIAlertAction(title: defaultText ?? L10n.genericOk, style: .default) { [weak self] _ in
                    self?.popup = nil
                    defaultAction?(())
                }
                self.popup?.addAction(effectiveDefaultAction)
                
                if let cancelText = cancelText {
                    let effectiveCancelAction = UIAlertAction(title: cancelText, style: .cancel) { [weak self] _ in
                        self?.popup = nil
                        cancelAction?(())
                    }
                    self.popup?.addAction(effectiveCancelAction)
                }
                
                referenceViewController.present(self.popup!, animated: true) {
                    
                }
                
            }
            
            if let loader = self.loader {
                loader.dismiss(animated: true) { [weak self] in
                    self?.loader = nil
                    letsDoIt()
                }
            }else{
                letsDoIt()
            }
        }
    }
    
    func showLoader(message: String?, dismissText: String?, dismissHandler: DismissAction?, navigationController: UINavigationController?) {
        
        // Non viene visualizzato se le animazioni sono disattivate! 👻
        guard !ProcessInfo().arguments.contains("SKIP_ANIMATIONS") else { return }
        
        guard loader == nil else { return }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            guard let referenceViewController = navigationController ?? UIApplication.shared.keyWindow?.visibleViewController, !(referenceViewController is UIAlertController) else {
                log("😕 Nessun view controller o navigation controller visibile per la presentazione del loader")
                return
            }
            
            let letsDoIt = { [weak self] in
                guard let self = self else { return }
                self.loader = UIAlertController(title: nil, message: L10n.genericWait, preferredStyle: .alert)
                let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.style = .white
                loadingIndicator.startAnimating()
                
                if let dismissText = dismissText {
                    let dismissAction = UIAlertAction(title: dismissText, style: .cancel) { [weak self] _ in
                        self?.loader = nil
                        dismissHandler?(())
                    }
                    self.loader?.addAction(dismissAction)
                }
                
                self.loader?.view.addSubview(loadingIndicator)
                referenceViewController.present(self.loader!, animated: true)
            }
            
            if let popup = self.popup {
                popup.dismiss(animated: true) { [weak self] in
                    self?.popup = nil
                    letsDoIt()
                }
            }else{
                letsDoIt()
            }
        }
    }
    
    func hideLoader() {
        guard loader != nil else { return }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loader!.dismiss(animated: true)
            self.loader = nil
        }
    }
    
    func isLoaderVisible() -> Bool {
        return loader != nil
    }
    
    
    // MARK: Private
    
    
}
