//
//  AppDelegate.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import UIKit
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Disattivazione animazioni in caso l'app sia stata avviata da Fastlane Snapshots
        if ProcessInfo().arguments.contains("SKIP_ANIMATIONS") {
            UIView.setAnimationsEnabled(false)
        }
        
        // Impostazione dell'auto-avoid della tastiera sui campi di testo
        IQKeyboardManager.shared().isEnabled = true
        
        // Impostazione del coordinator principale
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
        
        return true
    }
}

// Logga con timestamp iniziale
func log(_ string: String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    print("\(dateFormatter.string(from: Date())): \(string)")
}
