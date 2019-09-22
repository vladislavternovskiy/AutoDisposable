//
//  Single+AutoDispose.swift
//  AutoDisposable
//
//  Created by v.ternovskyi on 9/18/19.
//  Copyright © 2019 Vladyslav Ternovskyi. All rights reserved.
//

import RxSwift

public extension PrimitiveSequenceType where Trait == SingleTrait {
    
    /**
     Subscribes `observer` to receive events for this sequence.
     
     - parameter target: An object that composes subscribtions and destroys them on deinit.
     - parameter observer: Observer that receives events.
     - returns: Subscription for `observer` that can be used to cancel production of sequence elements and free resources.
     */
    public func subscribeWithAutoDispose(target: AutoDisposable, observer: @escaping (SingleEvent<Element>) -> Void) {
        let disposable = subscribe(observer)
        target.subscriptions.append(disposable)
    }
    
    /**
     Subscribes a success handler, and an error handler for this sequence.
     
     - parameter target: An object that composes subscribtions and destroys them on deinit.
     - parameter onSuccess: Action to invoke for each element in the observable sequence.
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    public func subscribeWithAutoDispose(target: AutoDisposable, onSuccess: ((Element) -> Void)? = nil, onError: ((Swift.Error) -> Void)? = nil) {
        let disposable = subscribe(onSuccess: onSuccess, onError: onError)
        target.subscriptions.append(disposable)
    }
}
