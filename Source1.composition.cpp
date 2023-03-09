#include <iostream>
#include <string>
#include <vector>

using namespace std;


//1) �������� ������ ���� �� ���������� - ������ ���� ��� ������, ���� �� ������� - �����, � ������ - ������������ ����� ������.� ����� �������� ����������� �����.

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

//��������� �� 3 ������� �� ������������ � ���������� �����������
/*
   ������������
   ������ - �����
   ������ - ����
   ����� - ��������

   ���������� �����������
   ��������� "����������� ����������" - ����� "������" - ���������� ������ "�������� �������� ����������� ���������� � �������� � ����� ��������"
   ��������� "������" - ����� "�������" - ���������� ������ "��������������"
   ��������� "���������" - ����� "������" - ���������� ������ "����������� �������, ������������ ��� ��������� �������� ���-�� �����"
*/