//
//  ApiClient.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import Foundation

public struct ApiClient {
    
    static func getDataFromServer( complete: @escaping (_ success: Bool, _ data: [Data]? )->() ){
        DispatchQueue.global().async {
            sleep(2)
            var dummyData: [Data] = [Data]()
            for i in 0...100{
                dummyData.append(Data(title: "This is a title \(i)", subTitle: "This is a subtitle"))
            }
            complete(true, dummyData)
            // If server gives an error, use "complete(false, nil)"
        }
    }
}
