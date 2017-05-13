//
//  SignUpOperation.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class SignUpOperation: ServiceOperation {
    
    private let request: SignUpRequest
    
    init(userID: String, password: String, roles: Array<String>, name: String, surname: String,
         phoneNumber: String, email: String, passwordChangeDate: Int) {
        request = SignUpRequest(userID: userID, password: password, roles: roles, name: name, surname: surname,
                                phoneNumber: phoneNumber, email: email, passwordChangeDate: passwordChangeDate)
        super.init()
    }
    
    private(set) var result: RequestResult<SignUpItem>?
    var resultCompletion: ((RequestResult<SignUpItem>) -> Void)?
    
    func start() {
        service.request(request, completion: handleResponse)
    }
    
    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try SignUpResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }
    
    func callCompletion(_ result: RequestResult<SignUpItem>) {
        self.result = result
        resultCompletion?(result)
    }
}
