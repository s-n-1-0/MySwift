//
//  NSPredicate.swift
//  
//
//  Created by Mac10 on 2022/05/21.
//

import Foundation
extension NSPredicate{
    public func compoundPredicate(type:NSCompoundPredicate.LogicalType,predicate:NSPredicate){
        NSCompoundPredicate(type: type, subpredicates: [self,predicate])
    }
    public func compoundPredicate(type:NSCompoundPredicate.LogicalType,predicates:[NSPredicate]){
        NSCompoundPredicate(type: type, subpredicates: [self] + predicates)
    }
}
