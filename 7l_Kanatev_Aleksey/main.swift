//
//  main.swift
//  7l_Kanatev_Aleksey
//
//  Created by AlexMacPro on 13/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import Foundation

enum ChoosingProfessionError: Error {
    case doesntMatch
}

enum Abilities {
    case money
    case future
    case fun
}

enum ProfessionsList {
    case unemployed
    case taxiDriver
    case iOSProgrammer
}

struct Professions {
    let nameOfProfession: ProfessionsList
    let professionAbilities: [Abilities]
}

struct Person {
    let name: String
    let lifePurposes: [Abilities]
    private var profession: ProfessionsList = .unemployed

    mutating func choosingProfession(newProfession: ProfessionsList) throws {
        // функцию надо будет доработать, т.к. изменение порядка параметров профессии при инициализации персоны приводит к несоответствию целей человека и особенностей профессии. Сейчас не успеваю уже доработать =)
        for element in professionsArray {
            if element.nameOfProfession == newProfession {
                guard element.professionAbilities == self.lifePurposes else {
                    throw ChoosingProfessionError.doesntMatch
                }
                self.profession = newProfession
            }
        }
    }
    
    init(name: String, lifePurposes: [Abilities]){
        self.name = name
        self.lifePurposes = lifePurposes
    }
}

extension Person: CustomStringConvertible {
    var description: String {
        return "Имя нашего героя: \(name), Профессия: \(profession)"
    }
}


let professionsArray = [
    Professions(nameOfProfession: .unemployed, professionAbilities: [.fun]),
    Professions(nameOfProfession: .taxiDriver, professionAbilities: [.money]),
    Professions(nameOfProfession: .iOSProgrammer, professionAbilities: [.fun, .future, .money])
]


var person1 = Person(name: "Dan", lifePurposes: [.fun, .future, .money])
var person2 = Person(name: "Victor", lifePurposes: [.money])

print("Выводим информацию о человеке")

print(person1)
print("\nПробуем выбрать неподходящую профессию.")

do {
    try person1.choosingProfession(newProfession: .taxiDriver)
} catch ChoosingProfessionError.doesntMatch {
    print("Ошибка. Профессия, которую вы пытаетесь выбрать, не соответствует вашим планам на жизнь. Выберите другую профессию.\n")
}
print("Проверяем, что профессия еще не выбрана")
print(person1)

print("\nПробуем снова сменить профессию.\n")

do {
try  person1.choosingProfession(newProfession: .iOSProgrammer)
} catch ChoosingProfessionError.doesntMatch {
    print("Ошибка. Профессия, которую вы пытаетесь выбрать, не соответствует вашим планам на жизнь. Выберите другую профессию.\n")
}
print("Проверяем, что человек сменил профессию.")
print(person1)


print("\nВыводим информацию о еще одном человеке\n")

print(person2)

print("\nПробуем выбрать неподходящую профессию.")

do {
    try person2.choosingProfession(newProfession: .iOSProgrammer)
} catch ChoosingProfessionError.doesntMatch {
    print("Ошибка. Профессия, которую вы пытаетесь выбрать, не соответствует вашим планам на жизнь. Выберите другую профессию.\n")
}
print("Проверяем, что профессия еще не выбрана")

print(person2)


do {
    try person2.choosingProfession(newProfession: .taxiDriver)
} catch ChoosingProfessionError.doesntMatch {
    print("Ошибка. Профессия, которую вы пытаетесь выбрать, не соответствует вашим планам на жизнь. Выберите другую профессию.\n")
}
print("\nПроверяем изменения")
print(person2)

print(" ")
