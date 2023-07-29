//
//  Extensions.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 7/17/23.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        //once we got data
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            //if we catch an error...
            return [:]
        }
    }
}
