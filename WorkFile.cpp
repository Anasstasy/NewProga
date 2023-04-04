#include <iostream>
#include <vector>
#include <string>
using namespace std;
//��� ���������� �������� ������������ ��������������� ����� ������� ��� ������: ���� ��� ������ � ������� (FileWork), � ������ ��� ��������� ������ �� ������ (DataProcessing).
//����� FileWork ����� ����� ������ ��� ������, ������ � �������� ������. �� �� ����� �������� �� ��������� ������, � ������ �� ������ � �������.
class FileWork 
{
public:
    bool readFile(string filename, string& content) 
    {
        // ���������� ������ �����
    }

    bool writeFile(string filename, const string& content) 
    {
        // ���������� ������ �����
    }

    bool deleteFile(string filename) 
    {
        // ���������� �������� �����
    }
};

//����� DataProcessing ����� �������� �� ��������� ������ �� ������. �� ����� ����� ������ ��� ��������� ������, ��������, ��� �������� ������ �� ����� ��� ��� �������������� ������.

class DataProcessing
{
public:
    bool parseData(const string& content, vector<string>& data) 
    {
        // ���������� �������� ������ �� ������
    }

    bool processData(vector<string>& data) {
        // ���������� ��������� ������
    }
};

//����� FileWork �������� ������ �� ������ � �������, � ����� DataProcessing �������� ������ �� ��������� ������. ��� ��� ������ ����� �������������� ���������� ���� �� �����, � ���� ����������� �������� ������ ��������� ������, ��� ����� ����� �������, �� ���������� ����� FileWork. ��� � ���� ������� ������������ ���������������.