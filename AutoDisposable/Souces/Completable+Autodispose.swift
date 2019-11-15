//
//  Completable+AutoDispose.swift
//  AutoDisposable
//
//  Created by v.ternovskyi on 9/18/19.
//  Copyright © 2019 Vladyslav Ternovskyi. All rights reserved.
//

import RxSwift

public extension PrimitiveSequenceType where Trait == CompletableTrait, Element == Swift.Never {
    
    /**
     Subscribes `observer` to receive events for this sequence.
     
     - parameter observer: Observer that receives events.
     - returns: Subscription for `observer` that can be used to cancel production of sequence elements and free resources.
     */
    func subscribeWithAutoDispose(_ target: AutoDisposable, observer: @escaping (CompletableEvent) -> Void) {
        let disposable = subscribe(observer)
        target.subscriptions.append(disposable)
    }
    
    /**
     Subscribes a completion handler and an error handler for this sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    func subscribeWithAutoDispose(_ target: AutoDisposable, onCompleted: (() -> Void)? = nil, onError: ((Swift.Error) -> Void)? = nil) {
        let disposable = subscribe(onCompleted: onCompleted, onError: onError)
        target.subscriptions.append(disposable)
    }
}
