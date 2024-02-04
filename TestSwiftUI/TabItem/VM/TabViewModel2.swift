//
//  TabViewModel2.swift
//  TestSwiftUI
//
//  Created by Leojin on 2024/01/30.
//

import SwiftUI
import Combine

class TabViewModel2: ObservableObject {
    var idText = CurrentValueSubject<String, Never>("")
    var passwordText = CurrentValueSubject<String, Never>("")
}
