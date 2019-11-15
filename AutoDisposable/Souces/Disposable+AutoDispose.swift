//
//  Disposable+AutoDispose.swift
//  AutoDisposable
//
//  Created by v.ternovskyi on 9/19/19.
//  Copyright © 2019 Vladyslav Ternovskyi. All rights reserved.
//

import RxSwift

public extension Disposable {
    
    /// Add a disposable resource to the autodisposing subscriptions
    func setAutoDispose(_ target: AutoDisposable) {
        target.subscriptions.append(self)
    }
}
