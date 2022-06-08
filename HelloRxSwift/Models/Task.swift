//
//  Task.swift
//  HelloRxSwift
//
//  Created by Артур Дохно on 08.06.2022.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
