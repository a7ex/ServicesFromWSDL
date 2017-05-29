//
//  InformationService.swift

//  Automatically created by ServicesFromWSDL.
//  Copyright (c) 2016 Farbflash. All rights reserved.

// DO NOT EDIT THIS FILE!
// This file was automatically generated from a wsdl definitions wsdl file)
// Edit the source data and then use the ServicesFromWSDL
// to create the corresponding services files automatically

import Foundation
import DLRModels

struct InformationService {
    private let connector: ServerServicesConnector
    enum DTOServiceError: Error {
        case none, unableToCreateDTO
    }

    init(connector: ServerServicesConnector) {
        self.connector = connector
    }

    func getStatistic(completion: ((GetStatisticResponse?, Error?) -> Void)?) {
        call("getStatistic", parameters: nil, completion: completion)
    }

    func getAvailableObjects(completion: ((GetObjectsResponse?, Error?) -> Void)?) {
        call("getAvailableObjects", parameters: nil, completion: completion)
    }

    func getCompanies(completion: ((GetCompaniesResponse?, Error?) -> Void)?) {
        call("getCompanies", parameters: nil, completion: completion)
    }

    private func call<T: JSOBJSerializable>(_ function: String, parameters: JSOBJ?, completion: ((T?, Error?) -> Void)?) {
        connector.callWSDLFunction(named: function, parameters: parameters) { (rslt, error) in
            if let error = error { completion?(nil, error) }
            else {
                if let obj = T(jsonData: (rslt as? [String: Any])?["return"] as? JSOBJ) { completion?(obj, nil) }                else { completion?(nil, DTOServiceError.unableToCreateDTO) }
            }
        }
    }

    private func call(_ function: String, parameters: JSOBJ?, completion: ((Error?) -> Void)?) {
        connector.callWSDLFunction(named: function, parameters: parameters) { (rslt, error) in
            completion?(error)
        }
    }
}
