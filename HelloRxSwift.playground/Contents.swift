import UIKit
import RxSwift
import RxCocoa

// отвечает за работу с памятью
// своего рода мусорный бак
let disposeBag = DisposeBag()

//// of работает с элементами
//Observable.of("A", "B", "C")
//    .subscribe { event in
//        print(event.element)
//    }
//    .disposed(by: disposeBag)
//
//// from работает с массивами
//Observable.from(["A", "B", "C"])
//    .subscribe { event in
//        print(event)
//    }
//    .disposed(by: disposeBag)
//
//Observable<String>.create { observer in
//    observer.onNext("A")
//    observer.onNext("B")
//    observer.onCompleted()
//
//    return Disposables.create()
//
//}.subscribe { element in
//    print(element)
//} onError: { error in
//    print(error.localizedDescription)
//} onCompleted: {
//    print("completed")
//} onDisposed: {
//    print("disposed")
//}.disposed(by: disposeBag)
//
//// является наблюдателем и наблюдаемым
//// если на него подписаться, подписчик будет получать только самые последние эвенты
//let subject = PublishSubject<String>()
//subject.onNext("Issue 1")
//subject.onNext("Issue 2")
//
//subject.subscribe { event in
//    print(event)
//}.disposed(by: disposeBag)
//
//subject.onNext("Issue 3")
//subject.onNext("Issue 4")

//// имеет дефолтное значение раньше был Variable
//let behaviorSubject = BehaviorSubject(value: "initial value")
//// если добавить event то перезапишется дефолтное значение
//behaviorSubject.onNext("Issue 1")
//
//behaviorSubject.subscribe { event in
//    print(event)
//}.disposed(by: disposeBag)
//
//// если добавлять эвенты после подписки то он не перезапишит дефолтное значение
//behaviorSubject.onNext("Issue 2")
//behaviorSubject.onNext("Issue 3")

//// имеет буфер
//let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
//
//replaySubject.onNext("Issue 1")
//replaySubject.onNext("Issue 2")
//// выдаст только два последних, так как у нас размер 2 и выдает последнии эвенты
//replaySubject.onNext("Issue 3")
//replaySubject.onNext("Issue 4")
//
//replaySubject.subscribe { event in
//    print(event)
//}.disposed(by: disposeBag)
//
//// после подписки если добавлять эвенты то они не будет ограничены буфером
//replaySubject.onNext("Issue 5")
//replaySubject.onNext("Issue 6")

