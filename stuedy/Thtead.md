# Thtead

## DispatchQueue

- userInteractive
- userInitiated
- default
- utility
- background


### userInteractive
유저 사용성을 위해 즉시 수행되는 타입.
UI 갱신, 사용자 이벤트 처리, 애니메이션 등에 사용

### userInititated
비동기 UI queue 에서 수행되지만, 시스템의 다른 작업들보다 우선순위가 높게 수행된다.
일단 시작되면 끝나기 전에 다른 작업이 중간에 다시 시작될일은 거의 없다. 빠르게 수행될 수 있고, UI 상호작용을 해야 하는 경우에 사용한다.

### default
시스템에서 제공하는 Qos class 따르기 위해 사용하는 것으로 qos와 구분을 위해 정의된 것은 아니다.

### utility
지속적인 작업이 필요할때 사용할 타입이다. 시스템에서 비교적 높은 레벨로 수행된다.
에너지 효율적으로 동작한다고 한다.

### background
시간에 민감하지 않은 작업들을 수행할때 사용된다. 언제 수행될지는 GCD가 컨트롤 한다.



