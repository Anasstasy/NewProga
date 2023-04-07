#include <iostream>
using namespace std;

// Абстрактный класс еды
class Food 
{
public:
    virtual void prepare() = 0;
};

// классы завтрака, обеда и ужина наследуются от абстрактного класса Food
// 
// Класс завтрака
class Breakfast : public Food 
{
public:
    void prepare() 
    {
        cout << "Preparing breakfast..." << endl;
        // Конкретная реализация подготовки завтрака
    }
};

// Класс обеда
class Lunch : public Food 
{
public:
    void prepare() 
    {
        cout << "Preparing lunch..." << endl;
        // Конкретная реализация подготовки обеда
    }
};

// Класс ужина
class Dinner : public Food 
{
public:
    void prepare() 
    {
        cout << "Preparing dinner..." << endl;
        // Конкретная реализация подготовки ужина
    }
};

// Класс человека
//Класс Person имеет метод eating, который принимает объект типа Food в качестве аргумента
class Person 
{
public:
    void eating(Food* food) 
    {
        food->prepare();
        cout << "Eating..." << endl;
        // Логика поедания еды
    }
};

int main() 
{
    Person person;
    Breakfast breakfast;
    Lunch lunch;
    Dinner dinner;

    person.eating(&breakfast);
    person.eating(&lunch);
    person.eating(&dinner);

    return 0;
}
