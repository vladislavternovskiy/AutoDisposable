//
//  AutoDisposable.swift
//  AutoDisposable
//
//  Created by v.ternovskyi on 9/18/19.
//  Copyright © 2019 Vladyslav Ternovskyi. All rights reserved.
//

import RxSwift

public class AutoDisposable {
    
    internal var subscriptions = [Disposable]()
    
    deinit {
        subscriptions.forEach { $0.dispose() }
    }
}
