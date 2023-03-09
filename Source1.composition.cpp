#include <iostream>
#include <string>
#include <vector>

using namespace std;


//1) написать пример кода на композицию - должно быть два класса, один из которых - ЦЕЛОЕ, а второй - неотъемлемая часть целого.в мейне написать проверочные тесты.

class Dog 
{
public:
    void setBreed(const string& breed) 
    {
        m_breed = breed;
    }
    const string& getBreed() const 
    {
        return m_breed;
    }
    void setAge(int age) 
    {
        m_age = age;
    }
    int getAge() const 
    {
        return m_age;
    }
};

class Animal {
public:
    void setSpecies(const string& species) 
    {
        m_species = species;
    }
    const string& getSpecies() const 
    {
        return m_species;
    }
    void setDog(const Dog& dog) 
    {
        m_dog = dog;
    }
    const Dog& getDog() const 
    {
        return m_dog;
    }
private:
    string m_species;
    Dog m_dog;
};

int main() 
{
    Dog dog;
    dog.setBreed("Schipperke");
    dog.setAge(5);

    Animal animal;
    animal.setSpecies("Mammal");
    animal.setDog(dog);

    cout << "Animal species: " << animal.getSpecies() << endl;
    cout << "Dog breed: " << animal.getDog().getBreed() << endl;
    cout << "Dog age: " << animal.getDog().getAge() << endl;

    return 0;
}

//придумать по 3 примера на наследование и реализацию интерфейсов
/*
   Наследование
   Солнце - лучик
   Фигуры - ромб
   Овощи - баклажан

   Реализация интерфейсов
   Интерфейс "Музыкальный инструмент" - класс "Гитара" - переменные класса "Струнный щипковый музыкальный инструмент с корпусом в форме восьмёрки"
   Интерфейс "Фигура" - класс "Квадрат" - переменные класса "Равносторонний"
   Интерфейс "Транспорт" - класс "Самолёт" - переменные класса "Летательный аппарат, используется для перевозки большого кол-ва груза"
*/