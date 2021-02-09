//
//  AppContainer.swift
//
//  Created by Riccardo Tribbia on 09/02/21.
//

import Foundation
import Swinject
import RxSwift

class AppContainer {
    
    static let shared: Container = {
        let container = Container()
        
        //************* HELPERS **************//
        
        //************* SERVICES *************//
        
        //************* MANAGERS *************//
        
        //************* VIEWMODELS *************//
        
        return container
    }()
    
    static let sharedResolver: Resolver = {
        return shared.synchronize()
    }()
}
