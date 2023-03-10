#include <iostream>
#include <string>
#include <vector>

using namespace std;


//1) написать пример кода на композицию - должно быть два класса, один из которых - ЦЕЛОЕ, а второй - неотъемлемая часть целого.в мейне написать проверочные тесты.

class Animal {
private:
    string species_;
public:
    Animal(const string& species) : species_(species) {}
    string getSpecies() {
        return species_;
    }
};

class Dog {
private:
    string name_;
    Animal* animal_;
public:
    Dog(const string& name, const string& species) :
        name_(name), animal_(new Animal(species)) {}

    ~Dog() {
        delete animal_;
    }

    void bark() {
        cout << name_ << " the " << animal_->getSpecies() << " is barking." << endl;
    }
};

int main() {
    Dog myDog("Zhuzha", "Schipperke");
    myDog.bark();
    return 0;
}

//придумать по 3 примера на наследование и реализацию интерфейсов
/*
   Наследование
   Фрукт - манго
   Фигура - ромб
   Овощь - баклажан

   Реализация интерфейсов
   Интерфейс "Музыкальный инструмент" - класс "Гитара" - переменные класса "Струнный щипковый музыкальный инструмент с корпусом в форме восьмёрки"
   Интерфейс "Фигура" - класс "Квадрат" - переменные класса "Равносторонний"
   Интерфейс "Транспорт" - класс "Самолёт" - переменные класса "Летательный аппарат, используется для перевозки большого кол-ва груза"
*/
