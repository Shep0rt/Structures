//
//  main.swift
//  structures
//
//  Created by Pavel Michka on 21.11.2022.
//
import Foundation

//Структуры
//Задание 1
//Реализуйте структуру Point, описывающую точку на плоскости (2 оси)
//Структура должна обладать следующими характеристиками:
//— свойство, описывающее координаты очки на плоскости
//— метод, принимающую другую точку в качестве входного аргумента и возвращающий расстояние между текущей точкой и переданной
//Проверьте работоспособность вашей структуры
//Расстояние между точками с координатам (10,20) и (15,22) должно быть равно [Double] 5.385164807134504
struct Point {
    var coordinate: (x: Double, y: Double)
    func distancePoints (point: Point) -> Double {
        sqrt(pow(Double(point.coordinate.x - self.coordinate.x), 2) + pow(point.coordinate.y - self.coordinate.y, 2))
    }
}
var point1 = Point(coordinate: (10, 20))
var point2 = Point(coordinate: (15, 22))
point1.distancePoints(point: point2)

//Задание 2
//Ранее мы уже моделировали с вами сущность шахматная фигура с помощью перечисления Chessman. В этот раз мы смоделируем фигуру с помощью структуры, значительно расширив возможности данной модели. Вы конечно же можете использовать наработки из заданий главы «Перечисления».
//1) Создайте перечисление Color, которое будет содержать два члена, описывающих цвета фигур. Для каждого члена укажите связанное значение, определяющее наименование цвета на английском языке
//2) Создайте перечисление Type, членами которого будут являться шахматные фигуры. Для каждого члена укажите связанное значение, определяющее наименование фигуры на английском языке
//3) Объявите две переменные. Первой инициализируйте член перечисления Color, а второй — Type
//4) Создайте структуру Chessman, которая описывает сущность «шахматная фигура».
//Перечисление должно содержать следующие элементы:
//— свойство color типа Color, определяющее цвет фиугры
//— свойство type типа Type, определяющее тип фигуры
//— свойство coordinates типа (Character, UInt)?, определяющее координаты фигуры на шахматной доске.
//— свойство symbol, определяющее UTF-символ данной шахматной фигуры (тип Character)
//— инициализатор, принимающий значения свойств color и type, и устанавливающий coordinates в nil, а symbol в ""
//— инициализатор, принимающий на вход значения для всех свойств: color, type, coordinates, symbol
//— метод setCoordinates(Character,UInt), позволяющий установить новые координаты фигуры
//— метод kill(), сменяющий координаты на nil (убивающий фигуру)
//5) Объявите переменную whiteKing и инициализируйте ей значение типа Chessman, описывающее фигуру «Белый король». Попробуйте использовать каждый из созданных методов структуры.

enum Color: String {
    case Black = "Black"
    case White = "White"
}

enum Figure: String {
    case King = "King"
    case Rook = "Rook"
    case Queen = "Queen"
    case Elephant = "Elephant"
    case Horse = "Horse"
    case Pawn = "Pawn"
}

var var1 = Color.Black
var var2 = Figure.Queen

struct Chessman {
    var color: Color
    var figure: Figure
    var coordinates: (Character, UInt)?
    var symbol: Character?
    
    init(color: Color, type: Figure) {
        self.color = color
        figure = type
        coordinates = nil
        symbol = nil
    }
    
    init(color: Color, type: Figure, coordinates: (Character, UInt), symbol: Character) {
        self.color = color
        figure = type
        self.coordinates = coordinates
        self.symbol = symbol
    }
    
    mutating func setCoordinates (letter a: Character, number b: UInt) {
        self.coordinates = (a, b)
    }
    
    mutating func kill () {
        self.coordinates = nil
    }
}

var whiteKing = Chessman(color: .White, type: .King)
var blackKing = Chessman(color: .Black, type: .King)
var whiteQueen = Chessman(color: .White, type: .Queen, coordinates: ("A", 1), symbol: "\u{2655}")
var blackQueen = Chessman(color: .Black, type: .Queen, coordinates: ("B", 2), symbol: "\u{265B}")
blackQueen.kill()
blackQueen.coordinates
blackQueen.setCoordinates(letter: "B", number: 8)
blackQueen.coordinates
whiteKing.setCoordinates(letter: "A", number: 8)

//Задание 3
//1) Cоздайте структуру, описывающую сущность «Пользователь». В ее состав должны входить следюущие элементы:
//— свойства, содержащие имя и фамилию
//— инициализатор, принимающий только имя
//— инициализатор, принимающий имя и фамилию
//— метод, возвращающий информационную строку с указание имени и фамилии пользователя
//— методы, изменяющие имя и фамилию
//2) Проверьте созданную структуру

struct User {
    var name: String
    var sename: String?
    
    init(name: String) {
        self.name = name
        sename = nil
    }
    init(name: String, sename: String) {
        self.name = name
        self.sename = sename
    }
    
    func getNameAndSename () -> String {
        if self.sename != nil {
            return name + " " + sename!
        } else {
            return "У пользователя нет имени или фамилии"
        }
    }
    
    mutating func setNameAndSename (name: String, sename: String) {
        self.name = name
        self.sename = sename
    }
}

var user1 = User(name: "Hasbik")
var user2 = User(name: "Petya", sename: "Petrov")
user2.setNameAndSename(name: "Vasiliy", sename: "Sidorov")
user2.getNameAndSename()



