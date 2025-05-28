# Notification

## NotificationCenter

- 특정 이벤트가 발생하였음을 불특정 다수의 객체에게 알리기 위해 사용하는 클래스
- 어떤 객체라도 특정 이벤트가 발생했다는 알림을 받을 것이라고 Obsrver로 등록하면, NotificationCenter가 모든 관찰자 객체에게 알림 전달

### Noti 등록

####  closure 사용

```
NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "notiKey"), object: nil, queue: nil) { (noti) in
            let msg = noti.object as! String
            self.lb.text = msg
            print("noti Action")
        }
```

#### function 사용

```
// 실제 사용되는 부분
	NotificationCenter.default.addObserver(self, selector: #selector(notiAction(_:)), name: Notification.Name(rawValue: "notiKey"), object: nil)

// 함수 구현부
    @objc func notiAction(_ noti: Notification)
    {
        let msg = noti.object as! String
        lb.text = msg
        print("noti Action")
    }
```

### Notification Post

```
NotificationCenter.default.post(name: Notification.Name(rawValue: "notiKey"), object: tf.text)
```