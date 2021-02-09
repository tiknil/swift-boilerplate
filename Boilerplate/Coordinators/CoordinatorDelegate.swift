//
//  CoordinatorDelegate.swift
//
//  Created by Fabio Butti on 20/05/2020.
//  Copyright © 2020 Tiknil. All rights reserved.
//

protocol CoordinatorDelegate: class {
    func ended(coordinator: Coordinator)
    func ended(coordinator: Coordinator, with data: Any?)
}
