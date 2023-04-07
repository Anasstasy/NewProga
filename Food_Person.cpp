#include <iostream>
using namespace std;

// ����������� ����� ���
class Food 
{
public:
    virtual void prepare() = 0;
};

// ������ ��������, ����� � ����� ����������� �� ������������ ������ Food
// 
// ����� ��������
class Breakfast : public Food 
{
public:
    void prepare() 
    {
        cout << "Preparing breakfast..." << endl;
        // ���������� ���������� ���������� ��������
    }
};

// ����� �����
class Lunch : public Food 
{
public:
    void prepare() 
    {
        cout << "Preparing lunch..." << endl;
        // ���������� ���������� ���������� �����
    }
};

// ����� �����
class Dinner : public Food 
{
public:
    void prepare() 
    {
        cout << "Preparing dinner..." << endl;
        // ���������� ���������� ���������� �����
    }
};

// ����� ��������
//����� Person ����� ����� eating, ������� ��������� ������ ���� Food � �������� ���������
class Person 
{
public:
    void eating(Food* food) 
    {
        food->prepare();
        cout << "Eating..." << endl;
        // ������ �������� ���
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