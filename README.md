# AutoDisposable
## Usage

First off all, import `AutoDisposable` and inherit your object via `AutoDispose` or `AutoDisposableController`
```
class YourClass: AutoDispose {
    ...
}
```

There are two ways to adding your disposables to `bag`:

### 1) Using a `setAutoDispose` method

##### Driver:

```Driver
  loading
      .drive(onNext: { _ in
         ...   
      })
      .setAutoDispose(self)
```

##### Observable:

```Observable
  loading
      .bind(onNext: { _ in
         ...   
      })
      .setAutoDispose(self)
      
  loading
      .subscribe(onNext: { _ in
         ...   
      })
      .setAutoDispose(self)
```

##### Completable:

```Completable
  loading
      .subscribe(onCompleted: { _ in
         ...   
      })
      .setAutoDispose(self)
```
### 2) Using `setAutoDispose` method


##### Driver:

```Driver
  loading
      .driveWithAutoDispose(self, onNext: { _ in
            ...
       })
```

##### Observable:

```Observable
  loading
      .bindWithAutoDispose(self, onNext: { _ in
            ...
       })
       
  loading
      .subscribeWithAutoDispose(self, onNext: { _ in
         ...   
      })
```

##### Completable:

```Completable
  loading
      .subscribeWithAutoDispose(self, onCompleted: { _ in
            ...
       })
```

### Use the following entry in your Podfile:
```
pod 'AutoDisposable', :git => 'https://github.com/BiohazardUA/AutoDisposable.git', :tag => '1.0.2.beta1'
```

## License

Distributed under the MIT license. [See LICENSE](Distributed under the MIT license. [See LICENSE](https://github.com/BiohazardUA/AutoDisposable/blob/master/LICENSE) for details.) for details.

