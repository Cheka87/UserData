
import Foundation
import RealmSwift


class Human: Object{
    @objc dynamic var name = ""
    let dogs = List<Dog>()
}


class Dog: Object {
   @objc dynamic var name = ""
   @objc dynamic var age = 0
    @objc dynamic var owner: Human?
}

class Persistance{
    static let shared = Persistance()
    
//    private let kUserNameKey = "Persistance.kUserNameKey"
//
//    var userName: String? {
//        set {UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
//        get { return UserDefaults.standard.string(forKey: kUserNameKey)   }
//    }
    
    private let realm = try! Realm()
    
    func test(){
       
//        try! realm.write{
//            let dog = Dog()
//            dog.name = "Луша"
//            dog.age = 8
//            realm.add(dog)
//
//            let dog2 = Dog()
//            dog2.name = "Грей"
//            dog2.age = 6
//            realm.add(dog2)
//
//        }
        
        let allDogs = realm.objects(Dog.self).first!
        try! realm.write{
            realm.delete(allDogs)
//            for (index, dog) in allDogs.enumerated(){
//                dog.age = index * 2 + 2
            }
//        }
        for dog in realm.objects(Dog.self){
            print("-- \(dog.name) : \(dog.age)")
        }
    }
    
//    func addObj(data: String, obj: Object){
//
//        let data = obj
//
//        try! realm.write{
//
//        }
//    }
    
   
}
