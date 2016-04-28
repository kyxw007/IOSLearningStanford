//
//  User.swift
//  AutoLayout
//
//  Created by WangBen on 16/4/28.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import Foundation

struct User {
    
    let name:String
    let password:String
    let company:String
    let login:String

    
    static let database: Dictionary<String, User> = [
        "user1": User(name: "Ben Wang", password: "3.14", company: "Com.Huawei", login: "user1"),
        "user2": User(name: "Kyxw007", password: "3.14", company: "Com.Ericsson", login: "user2"),
        "user3": User(name: "Kyxw008", password: "3.14", company: "Com.Huawei", login: "user3"),
        "user4": User(name: "Kyxw009", password: "3.14", company: "Com.Huawei", login: "user4"),
        ]
   
    static func login(login: String, password: String) -> User?{
        if let user = database[login] {
            if user.password == password{
                return user
            }
        }
        return nil
        
    }
    
    
}