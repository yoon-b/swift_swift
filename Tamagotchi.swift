class Pets {

  var name: String = ""

  init() {
    name = "Baduk"
  }

  init(_ name: String) {
    self.name = name
  }

  func feed() {
    print("\(name) has been fed.")
  }

  func clean() {
    print("\(name) has taken a bath.")
  }

  func play() {
    print("\(name) enjoyed playing with you.")
  }

  func sleep() {
    print("\(name) went to sleep.")
  }

}

class Tamagotchi: Pets {

  var properties: [String:Int] = []
  var ageInDays: Double = 0
  var age: Double? {
    return ageInDays / 30
  }

  override init() {
    super.init()
    properties["hunger"] = 0
    properties["dirt"] = 0
    properties["boredom"] = 60
    properties["drowsiness"] = 0
    ageInDays = 0
  }

  convenience override init(_ name: String) {
    self.init()
    self.name = name
  }

  override func feed() {
    if properties["hunger"] == 0 {
      print("\(name) is already full.")
    }
    else {
      super.feed()
      properties["hunger"] = 0
      properties["dirt"]! += 20
      properties["boredom"]! += 20
      properties["drowsiness"]! += 10
    }
  }

  override func clean() {
    if properties["dirt"] == 0 {
      print("\(name) is already clean.")
    }
    else {
      super.clean()
      properties["hunger"]! += 20
      properties["dirt"] = 0
      properties["boredom"]! += 20
      properties["drowsiness"]! += 10
    }
  }

  override func play() {
    if properties["boredom"] == 0 {
      print("\(name) is already done playing.")
    }
    else {
      super.play()
      properties["hunger"]! += 20
      properties["dirt"]! += 20
      properties["boredom"] = 0
      properties["drowsiness"]! += 10
    }
  }

  override func sleep() {
    if properties["drowsiness"] == 0 {
      print("\(name) has already slept.")
    }
    else {
      super.sleep()
      properties["hunger"]! += 20
      properties["dirt"]! += 10
      properties["boredom"]! += 20
      properties["drowsiness"] = 0
      ageInDays += 1
    }
  } 

  func check() {
    print("hunger: \(properties["hunger"]!)", 
        "dirt: \(properties["dirt"]!)", 
        "boredom: \(properties["boredom"]!)", 
        "drowsiness: \(properties["drowsiness"]!)")

    if properties["hunger"]! >= 60 {
      print("\(name) is hungry")
    }

    if properties["dirt"]! >= 60 {
      print("\(name) is dirty")
    }

    if properties["boredom"]! >= 60 {
      print("\(name) is bored")
    }

    if properties["drowsiness"]! >= 60 {
      print("\(name) is sleepy")
    }  
  }

  func getAge() {
    print("\(name) is \(age!) months old.")
  }
}

var game = Tamagotchi("tamago")

"""
Retrieving a value as optional integer
찾는 값이 dictionary에 없을 수도(nil) 있으므로, dictionary[key]의 값은 항상 optional.
특정 값과의 단순 비교(==, 결과가 true or false 경우 밖에 없음))나 값을 할당하는 것(=)은 unwrap할 필요가 없으나, 
>, <와 같은 크기 비교나, 연산을 통해 값을 바꾸고자 하는 경우에는
optional binding을 통해 값을 unwrap하여 nil을 꺼내 app이 crash되는 불상사가 없도록 할 것... 
"""