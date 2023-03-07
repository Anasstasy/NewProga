#include <iostream>
#include <string>
#include <vector>

using namespace std;

//ДЗ:
//1) придумать 3 ситуации с агрегированием
//например : Библиотека - Книги, Швабра - Тряпка, Дипломат - Документы


class Mobile_phone // первый тип
{
public:
    string brand; // у телефона есть марка
};

class Person // вылез человек))
{
public:
    Mobile_phone* phone; // РЕАЛИЗАЦИЯ АГРЕГИРОВАНИЯ: в классе Человек присутствует поле-указатель с типом другого класса (Кошка)

    void PickUpSomeCat(Mobile_phone* some_phone)
    {
        phone = some_phone;
    }

    void DeleteCat()
    {
        phone = nullptr;
    }
};

int main()
{
    setlocale(LC_ALL, "ru");

    Person* Lisa = new Person; // сначала создаётся первый объект
    // ...
    // ...
    // ...
    Mobile_phone* Samsung = new Mobile_phone; // спустя какое-то время создаётся второй объект
    // момент "дружбы" двух объектов разных типов:
    // человек покупает себе телефон
    Lisa->PickUpSomeCat(Samsung);

    Lisa->DeleteCat(); // право владения Самсунгом теряется

    delete Samsung; // уничтожаем объект второго типа (телефон) (при том, что объект первого типа всё ещё жив (человек))
}


/*     Пример на Библиотека - Книги

// Определение структуры, содержащей информацию о книге
struct Book 
{
    string title;
    string author;
    int pages;
};

// Определение структуры, содержащей информацию о библиотеке
struct Library 
{
    string name;
    vector<Book> books; // Вектор книг в библиотеке
    int num_books() const 
    {
        return books.size(); // Метод, возвращающий количество книг в библиотеке
    }
};

int main() 
{
    setlocale(LC_ALL, "ru");
    // Создание объекта библиотеки и добавление книг
    Library my_library;
    my_library.name = "Моя библиотека";
    my_library.books.push_back({ "Стеклянный трон", "Сара Дж. Маас", 344 });
    my_library.books.push_back({ "Гордость и предубеждение", "Джейн Остин", 251 });
    my_library.books.push_back({ "Гипотеза любви", "Али Хейзелвуд", 416 });
    my_library.books.push_back({ "Королевство шипов и роз", "Сара Дж. Маас", 277 });
    my_library.books.push_back({ "Жестокий принц", "Холли Блэк", 371 });
    my_library.books.push_back({ "Караваль", "Стефани Гарбер", 383 });

    // Использование метода для получения количества книг в библиотеке
    int num_books = my_library.num_books();

    // Вывод результата
    cout << my_library.name << " содержит " << num_books << " книг." << endl;
    return 0;
}*/





