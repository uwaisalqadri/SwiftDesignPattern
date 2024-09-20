//
//  Memento.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

struct ClipboardMemento {
    let content: String
}

class Clipboard {
    private var content: String = ""
    
    func setContent(_ newContent: String) {
        content = newContent
    }
    
    func getContent() -> String {
        return content
    }
    
    func createMemento() -> ClipboardMemento {
        return ClipboardMemento(content: content)
    }
    
    func restore(from memento: ClipboardMemento) {
        content = memento.content
    }
}

class ClipboardManager {
    private let clipboard = Clipboard()
    private var undoStack: [ClipboardMemento] = []
    private var redoStack: [ClipboardMemento] = []
    
    func copy(_ content: String) {
        undoStack.append(clipboard.createMemento())
        
        redoStack.removeAll()
        
        clipboard.setContent(content)
    }
    
    func paste() -> String {
        return clipboard.getContent()
    }
    
    func undo() {
        guard let lastState = undoStack.popLast() else { return }
        
        redoStack.append(clipboard.createMemento())
        
        clipboard.restore(from: lastState)
    }
    
    func redo() {
        guard let lastState = redoStack.popLast() else { return }
        
        undoStack.append(clipboard.createMemento())
        
        clipboard.restore(from: lastState)
    }
}
