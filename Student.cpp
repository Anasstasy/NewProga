#include <iostream> 
#include <list> 
using namespace std;

// отдельный тип, который берёт на себя задачи по работе с датами (и возможно временем)
class Date
{
	int day;
	int month;
	int year;
public:
	Date(int day = 1, int month = 1, int year = 1)
	{
		this->day = day;
		this->month = month;
		this->year = year;
	}
	void SetDay(int day)
	{
		if (day < 1 || day > 31)
			throw "Incorrect day!";
		else
			this->day = day;
	}
	void SetMonth(int month)
	{
		if (month < 1 || month > 12)
			throw "Incorrect month!";
		else
			this->month = month;
	}
	void SetYear(int year)
	{
		if (year < 1 || year > 2023)
			throw "Incorrect year!";
		else
			this->year = year;
	}
	int GetDay() const
	{
		return this->day;
	}
	int GetMonth() const
	{
		return this->month;
	}
	int GetYear() const
	{
		return this->year;
	}
};

class Rate
{
	int value; // 1-12
	Date date;
	string subject;
	string prepod;
	int lesson;
public:
	Rate(int value = 1, Date date = Date(), string prepod = "Alexandr", string subject = "UML", int lesson = 1)
	{
		this->value = value;
		this->date = date;
		this->subject = subject;
		this->prepod = prepod;
		this->lesson = lesson;
	}
	void SetValue(int value)
	{
		if (value < 1 || value > 12)
			throw "Incorrect value!";
		else
			this->value = value;
	}
	void SetDate(Date date)
	{
		this->date = date;
	}
	void SetSubject(string subject)
	{
		this->subject = subject;
	}
	void SetPrepod(string prepod)
	{
		this->prepod = prepod;
	}
	void SetLesson(int lesson)
	{
		this->lesson = lesson;
	}
	int GetValue() const
	{
		return this->value;
	}
	Date GetDate() const
	{
		return this->date;
	}
	string GetPrepod() const
	{
		return this->prepod;
	}
	string GetSubject() const
	{
		return this->subject;
	}
	int GetLesson() const
	{
		return this->lesson;
	}
	bool operator == (const Rate& obj) const
	{
		if (obj.GetDate().GetDay() == GetDate().GetDay() &&
			obj.GetDate().GetMonth() == GetDate().GetMonth() &&
			obj.GetDate().GetYear() == GetDate().GetYear() &&
			obj.GetLesson() == GetLesson() &&
			obj.GetPrepod() == GetPrepod() &&
			obj.GetSubject() == GetSubject() &&
			obj.GetValue() == GetValue())
		{
			return true;
		}
		return false;
	}
};

class RateCollection
{
	list<Rate> rates;
public:
	RateCollection(list<Rate> rates = list<Rate>())
	{
		this->rates = rates;
	}
	void AddRate(Date date, string prepod, string subject, int value, int lesson) 
	{
		if (value < 1 || value > 12) throw "Error value!";
		else if (date.GetDay() < 1 || date.GetDay() > 31 || date.GetMonth() < 1 || date.GetMonth() > 12 || date.GetYear() < 1 || date.GetYear() > 2023)
			throw "Error date!";
		else if (prepod == "") throw "Error prepod";
		else if (subject == "") throw "Error subject";
		else if (lesson <= 0) throw "Error lesson";
		else
		{
			Rate obj = Rate(value, Date(date.GetDay(), date.GetMonth(), date.GetYear()), prepod, subject, lesson);
			this->rates.push_back(obj);
		}
	}

	void AddRate(Rate rate) 
	{
		if (rate.GetValue() < 1 || rate.GetValue() > 12) throw "Error value!";
		else if (rate.GetDate().GetDay() < 1 || rate.GetDate().GetDay() > 31 || rate.GetDate().GetMonth() < 1 || rate.GetDate().GetMonth() > 12 || rate.GetDate().GetYear() < 1 || rate.GetDate().GetYear() > 2023)
			throw "Error date!";
		else if (rate.GetPrepod() == "") throw "Error prepod";
		else if (rate.GetSubject() == "") throw "Error subject";
		else if (rate.GetLesson() <= 1) throw "Error subject";
		else
		{
			this->rates.push_back(rate);
		}
	}
	void ChangeRateCollection(int index)
	{
		int value;
		int day;
		int month;
		int year;
		string prepod;
		string subject;
		int lesson;
		cout << "Enter a value: ";
		cin >> value;
		while (value < 1 || value > 12)
		{
			cout << endl;
			cin >> value;
		}
		cout << endl << "Enter day: ";
		cin >> day;
		while (day < 1 || day > 31)
		{
			cout << endl;
			cin >> day;
		}
		cout << endl << "Enter month: ";
		cin >> month;
		while (month < 1 || month > 12)
		{
			cout << endl;
			cin >> month;
		}
		cout << endl << "Enter year: ";
		cin >> year;
		while (year < 1 || year > 2023)
		{
			cout << endl;
			cin >> year;
		}
		cout << endl << "Enter prepod: ";
		while (prepod == "")
		{
			cout << endl;
			cin >> prepod;
		}
		cout << endl << "Enter subject: ";
		while (subject == "")
		{
			cout << endl;
			cin >> subject;
		}
		cout << endl << "Enter lesson: ";
		cin >> lesson;
		while (lesson < 0)
		{
			cout << endl;
			cin >> lesson;
		}
		Rate obj = Rate(value, Date(day, month, year), prepod, subject, lesson);
		int counter = 0;
		for (Rate var : rates)
		{
			Rate prev = var;
			cout << prev.GetPrepod() << endl;
			if (counter == index)
			{
				rates.remove(var);
				rates.push_back(obj);
				break;
			}
			index++;
		}
	}
	void RemoveRate(int index)
	{
		int counter = 0;
		// Создаю цикл фор с переменной типа Rate, для того, чтобы пройтись по всем элементам списка типа Rate
		for (Rate var : rates)
		{
			Rate prev = var;
			if (counter == index)
			{
				rates.remove(prev);
			}
		}
	}
	void Show()
	{
		for (Rate var : rates)
		{
			cout << "Value: " << var.GetValue() << endl;
			cout << "Day: " << var.GetDate().GetDay() << endl;
			cout << "Month: " << var.GetDate().GetMonth() << endl;
			cout << "Year: " << var.GetDate().GetYear() << endl;
			cout << "Prepod: " << var.GetPrepod() << endl;
			cout << "Subject: " << var.GetSubject() << endl;
			cout << "Lesson: " << var.GetLesson() << endl;
		}
	}
	void SetRates(list<Rate> rates)
	{
		this->rates = rates;
	}
	list<Rate> GetRates() const
	{
		return this->rates;
	}
};

class Group
{
	string speciality;
	string group_name;
	int kurs;
public:
	Group(string speciality = "Design", string group_name = "KN-D-211", int kurs = 2)
	{
		this->speciality = speciality;
		this->group_name = group_name;
		this->kurs = kurs;
	}
};

class Adress
{
	string country;
	string region;
	string city;
	string street;
	int house_number;
	int flat_number;
	int postal_index;
public:
	Adress(string country = "Ukraine", string region = "Odesska", string city = "Odesa", string street = "Fontanskaya doroga", int house_number = 57, int flat_number = 85, int postal_index = 65016)
	{
		this->country = country;
		this->region = region;
		this->city = city;
		this->street = street;
		this->house_number = house_number;
		this->flat_number = flat_number;
		this->postal_index = postal_index;
	}
};

class Student
{
	string name;
	string lastname;
	string fathername;
	// нарушение ВЫСОКОГО СЦЕПЛЕНИЯ:
	// студент берёт на себя задачи, которые решать не должен!!!
	// вместо этих трёх полей ЛУЧШЕ...
	//int birth_day = 15; // 1-31
	//int birth_month = 10; // 1-12
	//int birth_year = 1998;
	Date* birthday;
	// ЭТИ ПОЛЯ убираем вообще, они студенту не нужны!!!
	//string eyes_color;
	//string hair_color;
	//double growth;
	//double weight;

	// int homeworks[100]; // со статическим массивом есть очень много проблем:
	// 1) память расходуется сразу, при том что изначально оценок нет вообще
	// 2) добавить 101-ый элемент в массив нельзя
	// 3) даже если сделать динамический массив, то возникает вопрос: почему тип данных Студент должен брать на себя ответственность за ВЫДЕЛЕНИЕ ПАМЯТИ под массив, ПЕРЕВЫДЕЛЕНЕИЕ, проверку диапазонов баллов от 1 до 12
	
	RateCollection homeworks; // гораздо лучше предусмотреть отдельный тип данных для работы с коллекцией оценок (там будут методы ДОБАВЛЕНИЯ, РЕДАКТИРОВАНИЯ, УДАЛЕНИЯ, просмотра)
	RateCollection practices; // сама по себе оценка - это тоже отдельный тип данных со своими деталями
	RateCollection kursachies;
	RateCollection exams;

	Group MyGroup;
	Adress MyAdress;
	double average_rate; // средний балл
	Date timeOfLearning;
	string university = "IT Step";
	string email = "nastya.khimich13@gmail.com";
	string phone_numbers[3] = { "+380996371141", "+380990330328" };
	string avatar = "https://fsx1.itstep.org/api/v1/files/XOPaBaJymN0UBQAq1n221eoYUSvFu7Jw";
public:
	Student(string name, string lastname, string fathername, Date birthday,
		RateCollection homeworks, RateCollection practices, RateCollection kursachies, RateCollection exams,
		Group MyGroup, Adress MyAdress, double average_rate, Date timeOfLearning)
	{
		this->name = name;
		this->lastname = lastname;
		this->fathername = fathername;
		this->birthday = new Date(birthday.GetDay(), birthday.GetMonth(), birthday.GetYear());
		this->homeworks = homeworks;
		this->practices = practices;
		this->kursachies = kursachies;
		this->exams = exams;
		this->MyGroup = MyGroup;
		this->MyAdress = MyAdress;
		this->average_rate = average_rate;
		this->timeOfLearning = timeOfLearning;
	}
	~Student()
	{
		delete this->birthday;
		this->birthday = nullptr;
	}
};


int main()
{
	setlocale(LC_ALL,"ru");
	//srand(time(0)); // для генерации случайных чисел
	//Date obj1 = Date();
	//cout << obj1.GetDay() << endl << obj1.GetMonth() << endl << obj1.GetYear() << endl;
	Rate object = Rate(2, Date(2, 3, 4), "a", "W", 2);
	Date secObj = object.GetDate();
	//cout <<secObj.GetDay() << endl << secObj.GetMonth() << endl << secObj.GetYear() << endl << obj.GetLesson() << endl << obj.GetPrepod() << endl << obj.GetValue();
	list<Rate> rateS = list<Rate>();
	rateS.push_back(object);
	RateCollection objC = RateCollection(rateS);
	objC.Show();
	objC.ChangeRateCollection(0);
	objC.Show();
}
