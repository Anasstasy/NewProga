#include <iostream>
#include <fstream>
#include <string>

using namespace std;

class FileWorker
{
public:
    static FileWorker& getInstance()
    {
        static FileWorker instance; // ������������ ��������� ������
        return instance;
    }

    void createFile(const string& filePath)
    {
        ofstream file(filePath);
        if (!file)
        {
            cerr << "Failed to create file: " << filePath << endl;
        }
        else
        {
            cout << "File created: " << filePath << endl;
            file.close();
        }
    }

    void renameFile(const string& oldPath, const string& newPath)
    {
        if (rename(oldPath.c_str(), newPath.c_str()) == 0)
        {
            cout << "File renamed from " << oldPath << " to " << newPath << endl;
        }
        else
        {
            cerr << "Failed to rename file: " << oldPath << endl;
        }
    }

    void deleteFile(const string& filePath)
    {
        if (remove(filePath.c_str()) == 0)
        {
            cout << "File deleted: " << filePath << endl;
        }
        else
        {
            cerr << "Failed to delete file: " << filePath << endl;
        }
    }

    bool fileExists(const string& filePath)
    {
        ifstream file(filePath);
        if (file)
        {
            file.close();
            return true;
        }
        else
        {
            return false;
        }
    }

private:
    FileWorker() {} // �������� �����������

    FileWorker(const FileWorker&) = delete; // ������ �����������
    FileWorker& operator=(const FileWorker&) = delete; // ������ ������������

    ~FileWorker() {} // ����������

};

int main()
{
    // ��������� ���������� FileWorker
    FileWorker& fileWorker = FileWorker::getInstance();

    // ������������� ������� FileWorker
    fileWorker.createFile("Testik.txt");
    fileWorker.renameFile("Testik.txt", "new_test.txt");
    fileWorker.deleteFile("new_test.txt");
    cout << boolalpha << fileWorker.fileExists("new_test.txt") << endl; // false

    // ������� �������� ������� ����������
    //FileWorker secondFileWorker; // ������ ����������

    return 0;
}