//
//  Driver+AutoDispose.swift
//  AutoDisposable
//
//  Created by v.ternovskyi on 9/18/19.
//  Copyright © 2019 Vladyslav Ternovskyi. All rights reserved.
//

import RxSwift
import RxCocoa

public extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    
    /**
     Creates new subscription and sends elements to observer.
     This method can be only called from `MainThread`.
     
     In this form it's equivalent to `subscribe` method, but it communicates intent better.
     
     - parameter observer: Observer that receives events.
     - returns: Disposable object that can be used to unsubscribe the observer from the subject.
     */
    func driveWithAutoDispose<Observer: ObserverType>(_ target: AutoDisposable, observer: Observer) where Observer.Element == Element {
        let disposable = drive(observer)
        target.subscriptions.append(disposable)
    }
    
    /**
     Creates new subscription and sends elements to observer.
     This method can be only called from `MainThread`.
     
     In this form it's equivalent to `subscribe` method, but it communicates intent better.
     
     - parameter observer: Observer that receives events.
     - returns: Disposable object that can be used to unsubscribe the observer from the subject.
     */
    func driveWithAutoDispose<Observer: ObserverType>(_ target: AutoDisposable, observer: Observer) where Observer.Element == Element? {
        let disposable = drive(observer)
        target.subscriptions.append(disposable)
    }
    
    /**
     Creates new subscription and sends elements to `BehaviorRelay`.
     This method can be only called from `MainThread`.
     
     - parameter relay: Target relay for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer from the relay.
     */
    func driveWithAutoDispose(_ target: AutoDisposable, relay: BehaviorRelay<Element>) {
        let disposable = drive(relay)
        target.subscriptions.append(disposable)
    }
    
    /**
     Creates new subscription and sends elements to `BehaviorRelay`.
     This method can be only called from `MainThread`.
     
     - parameter relay: Target relay for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer from the relay.
     */
    func driveWithAutoDispose(_ target: AutoDisposable, relay: BehaviorRelay<Element?>) {
        let disposable = drive(relay)
        target.subscriptions.append(disposable)
    }
    
    /**
     Subscribes an element handler, a completion handler and disposed handler to an observable sequence.
     This method can be only called from `MainThread`.
     
     Error callback is not exposed because `Driver` can't error out.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     gracefully completed, errored, or if the generation is canceled by disposing subscription)
     - parameter onDisposed: Action to invoke upon any type of termination of sequence (if the sequence has
     gracefully completed, errored, or if the generation is canceled by disposing subscription)
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    func driveWithAutoDispose(_ target: AutoDisposable, onNext: ((Element) -> Void)? = nil, onCompleted: (() -> Void)? = nil, onDisposed: (() -> Void)? = nil) {
        let disposable = drive(onNext: onNext, onCompleted: onCompleted, onDisposed: onDisposed)
        target.subscriptions.append(disposable)
    }
}
