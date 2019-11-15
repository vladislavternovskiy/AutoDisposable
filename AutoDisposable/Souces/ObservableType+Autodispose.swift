//
//  ObservableType+AutoDispose.swift
//  AutoDisposable
//
//  Created by v.ternovskyi on 9/18/19.
//  Copyright © 2019 Vladyslav Ternovskyi. All rights reserved.
//

import RxSwift

public extension ObservableType {
    
    /**
     Creates new subscription and sends elements to observer(s).
     In this form, it's equivalent to the `subscribe` method, but it better conveys intent, and enables
     writing more consistent binding code, and executing `subscribe` action in a main thread.
     
     - parameter to: Observers to receives events.
     - returns: Disposable object that can be used to unsubscribe the observers.
     */
    func bindWithAutoDispose<Observer: ObserverType>(_ target: AutoDisposable, to observers: Observer...) where Observer.Element == Element {
        let disposable = self.bind(to: observers)
        target.subscriptions.append(disposable)
    }
    
    /**
     Creates new subscription and sends elements to observer(s).
     In this form, it's equivalent to the `subscribe` method, but it better conveys intent, and enables
     writing more consistent binding code, and executing `subscribe` action in a main thread.
     
     - parameter to: Observers to receives events.
     - returns: Disposable object that can be used to unsubscribe the observers.
     */
    func bindWithAutoDispose<Observer: ObserverType>(_ target: AutoDisposable, to observers: Observer...) where Observer.Element == Element? {
        let disposable = self.map { $0 as Element? }.bind(to: observers)
        target.subscriptions.append(disposable)
    }
    
    /**
     Creates new subscription and sends elements to observer(s).
     In this form, it's equivalent to the `subscribe` method, but it better conveys intent, and enables
     writing more consistent binding code, and executing `subscribe` action in a main thread.
     - parameter to: Observers to receives events.
     - returns: Disposable object that can be used to unsubscribe the observers.
     */
    func bindWithAutoDispose<Observer: ObserverType>(_ target: AutoDisposable, to observers: [Observer]) where Observer.Element == Element {
        let disposable = bind(to: observers)
        target.subscriptions.append(disposable)
    }
    
    /**
     Subscribes an element handler to an observable sequence, and executing `subscribe` action in a main thread.
     In case error occurs in debug mode, `fatalError` will be raised.
     In case error occurs in release mode, `error` will be logged.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    func bindWithAutoDispose(_ target: AutoDisposable, onNext: @escaping (Element) -> Void) {
        let disposable = self.observeOn(MainScheduler()).bind(onNext: onNext)
        target.subscriptions.append(disposable)
    }
    
    /**
     Creates new subscription and sends elements to observer(s).
     In this form, it's equivalent to the `subscribe` method, but it better conveys intent, and enables
     writing more consistent binding code, and executing `subscribe` action in a main thread.
     
     - parameter to: Observers to receives events.
     - returns: Disposable object that can be used to unsubscribe the observers.
     */
    private func bind<Observer: ObserverType>(to observers: [Observer]) -> Disposable where Observer.Element == Element {
        return self.observeOn(MainScheduler()).subscribe { event in
            observers.forEach { $0.on(event) }
        }
    }
}

public extension ObservableType {
    
    /**
     Subscribes an element handler, an error handler, a completion handler and disposed handler to an observable sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - parameter onDisposed: Action to invoke upon any type of termination of sequence (if the sequence has
     gracefully completed, errored, or if the generation is canceled by disposing subscription).
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    func subscribeWithAutoDispose(_ target: AutoDisposable, onNext: ((Element) -> Void)? = nil, onError: ((Error) -> Void)? = nil, onCompleted: (() -> Void)? = nil, onDisposed: (() -> Void)? = nil) {
        let disposable = subscribe(onNext: onNext, onError: onError, onCompleted: onCompleted, onDisposed: onDisposed)
        target.subscriptions.append(disposable)
    }
    
    /**
     Subscribes an event handler to an observable sequence.
     
     - parameter on: Action to invoke for each event in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    func subscribeWithAutoDispose(_ target: AutoDisposable, on: @escaping (Event<Element>) -> Void) {
        let disposable = subscribe(on)
        target.subscriptions.append(disposable)
    }
}
