#include <iostream>
#include <string>
#include <vector>

using namespace std;

//��:
//1) ��������� 3 �������� � ��������������
//�������� : ���������� - �����, ������ - ������, �������� - ���������


class Mobile_phone // ������ ���
{
public:
    string brand; // � �������� ���� �����
};

class Person // ����� �������))
{
public:
    Mobile_phone* phone; // ���������� �������������: � ������ ������� ������������ ����-��������� � ����� ������� ������ (�����)

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

    Person* Lisa = new Person; // ������� �������� ������ ������
    // ...
    // ...
    // ...
    Mobile_phone* Samsung = new Mobile_phone; // ������ �����-�� ����� �������� ������ ������
    // ������ "������" ���� �������� ������ �����:
    // ������� �������� ���� �������
    Lisa->PickUpSomeCat(Samsung);

    Lisa->DeleteCat(); // ����� �������� ��������� ��������

    delete Samsung; // ���������� ������ ������� ���� (�������) (��� ���, ��� ������ ������� ���� �� ��� ��� (�������))
}


/*     ������ �� ���������� - �����

// ����������� ���������, ���������� ���������� � �����
struct Book 
{
    string title;
    string author;
    int pages;
};

// ����������� ���������, ���������� ���������� � ����������
struct Library 
{
    string name;
    vector<Book> books; // ������ ���� � ����������
    int num_books() const 
    {
        return books.size(); // �����, ������������ ���������� ���� � ����������
    }
};

int main() 
{
    setlocale(LC_ALL, "ru");
    // �������� ������� ���������� � ���������� ����
    Library my_library;
    my_library.name = "��� ����������";
    my_library.books.push_back({ "���������� ����", "���� ��. ����", 344 });
    my_library.books.push_back({ "�������� � �������������", "����� �����", 251 });
    my_library.books.push_back({ "�������� �����", "��� ���������", 416 });
    my_library.books.push_back({ "����������� ����� � ���", "���� ��. ����", 277 });
    my_library.books.push_back({ "�������� �����", "����� ����", 371 });
    my_library.books.push_back({ "��������", "������� ������", 383 });

    // ������������� ������ ��� ��������� ���������� ���� � ����������
    int num_books = my_library.num_books();

    // ����� ����������
    cout << my_library.name << " �������� " << num_books << " ����." << endl;
    return 0;
}*/





