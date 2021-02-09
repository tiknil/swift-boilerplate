//
//  Coordinator.swift
//
//  Created by Fabio Butti on 11/05/2020.
//  Copyright © 2019 Tiknil. All rights reserved.
//

/**
 Un coordinator è un oggetto che si occupa di gestire la navigazione tra schermate dell'app per una singola user story
 */
protocol Coordinator: AnyObject {
    // Lista dei coordinator figli, istanziati e avviati da questo coordinator.
    // È importante salvare un riferimento ai coordinator figli in questo array per evitare che vengano deallocati dal Garbage Collector
    var children: [Coordinator] { get set }
    
    // Funzione di avvio del coordinator che mostra la prima schermata della user story
    func start()
}

/**
 Metodi utili per tutti i coordinator
 */
extension Coordinator {
    // Aggiunge un coordinator figlio
    func add(child: Coordinator) {
        if !children.contains(where: { $0 === child }) {
            children.append(child)
        }
    }
    
    // Aggiunge un array di coordinator figli
    func add(children: [Coordinator]) {
        for child in children {
            add(child: child)
        }
    }
    
    // Rimuove un coordinator figlio
    func remove(child: Coordinator) {
        children = children.filter { $0 !== child }
    }
    
    // Rimuove un array di coordinator figli
    func remove(children: [Coordinator]) {
        for child in children {
            remove(child: child)
        }
    }
    
    // Aggiunge un nuovo coordinator figlio e lo avvia
    func addAndStart(child: Coordinator) {
        add(child: child)
        child.start()
    }
    
}

