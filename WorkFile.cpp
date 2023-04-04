#include <iostream>
#include <vector>
#include <string>
using namespace std;
//Для реализации принципа единственной ответственности можно создать два класса: один для работы с файлами (FileWork), а второй для обработки данных из файлов (DataProcessing).
//Класс FileWork будет иметь методы для чтения, записи и удаления файлов. Он не будет отвечать за обработку данных, а только за работу с файлами.
class FileWork 
{
public:
    bool readFile(string filename, string& content) 
    {
        // реализация чтения файла
    }

    bool writeFile(string filename, const string& content) 
    {
        // реализация записи файла
    }

    bool deleteFile(string filename) 
    {
        // реализация удаления файла
    }
};

//Класс DataProcessing будет отвечать за обработку данных из файлов. Он будет иметь методы для обработки данных, например, для парсинга данных из файла или для преобразования данных.

class DataProcessing
{
public:
    bool parseData(const string& content, vector<string>& data) 
    {
        // реализация парсинга данных из строки
    }

    bool processData(vector<string>& data) {
        // реализация обработки данных
    }
};

//класс FileWork отвечает только за работу с файлами, а класс DataProcessing отвечает только за обработку данных. Эти два класса могут использоваться независимо друг от друга, и если потребуется изменить методы обработки данных, это можно будет сделать, не затрагивая класс FileWork. Это и есть принцип единственной ответственности.