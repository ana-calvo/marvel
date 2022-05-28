//
//  BaseUseCase.swift
//  marvel
//
//  Created by Ana calvo on 28/5/22.
//

import Foundation

class BaseUseCase {
    
    var completionHandle: ((_ result: UseCaseResult) -> Void)?
    
    var result: UseCaseResult?
    
    var serviceError: Error?
    
    func execute() {
        
    }
    
    func completionCase(_ result: UseCaseResult, error: Error? = nil) {
        
        self.result = result
        self.serviceError = error
        
        self.responseCompletionResult(result: result)
    }
    
    func responseCompletionResult(result: UseCaseResult) {
        
        if self.completionHandle != nil {
            self.completionHandle!(result)
        }
    }
}
