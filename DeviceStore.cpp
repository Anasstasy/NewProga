#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Device {
public:
    Device(const string& manufacturer, const string& model, int quantity, double price, const string& color)
        : manufacturer_(manufacturer), model_(model), quantity_(quantity), price_(price), color_(color) {}

    virtual ~Device() {}

    virtual void print() const {
        cout << "Manufacturer: " << manufacturer_ << endl;
        cout << "Model: " << model_ << endl;
        cout << "Quantity: " << quantity_ << endl;
        cout << "Price: " << price_ << endl;
        cout << "Color: " << color_ << endl;
    }

    const string& getManufacturer() const {
        return manufacturer_;
    }

    const string& getModel() const {
        return model_;
    }

    int getQuantity() const {
        return quantity_;
    }

    double getPrice() const {
        return price_;
    }

    const string& getColor() const {
        return color_;
    }

private:
    string manufacturer_;
    string model_;
    int quantity_;
    double price_;
    string color_;
};

class MobilePhone : public Device {
public:
    MobilePhone(const string& manufacturer, const string& model, int quantity, double price, const string& color, const string& os)
        : Device(manufacturer, model, quantity, price, color), os_(os) {}

    void print() const override {
        Device::print();
        cout << "OS: " << os_ << endl;
    }

    const string& getOs() const {
        return os_;
    }

private:
    string os_;
};

class Laptop : public Device {
public:
    Laptop(const string& manufacturer, const string& model, int quantity, double price, const string& color, int ram)
        : Device(manufacturer, model, quantity, price, color), ram_(ram) {}

    void print() const override {
        Device::print();
        cout << "RAM: " << ram_ << " GB" << endl;
    }

    int getRam() const {
        return ram_;
    }

private:
    int ram_;
};

class Tablet : public Device {
public:
    Tablet(const string& manufacturer, const string& model, int quantity, double price, const string& color, const string& size)
        : Device(manufacturer, model, quantity, price, color), size_(size) {}

    void print() const override {
        Device::print();
        cout << "Size: " << size_ << endl;
    }

    const string& getSize() const {
        return size_;
    }

private:
    string size_;
};

int main() {
    vector<Device*> devices;

    // add devices to the list
    devices.push_back(new MobilePhone("Apple", "iPhone 13", 10, 999.99, "Blue", "iOS"));
    devices.push_back(new MobilePhone("Samsung", "Galaxy S21", 5, 799.99, "Black", "Android"));
    devices.push_back(new Laptop("Dell", "XPS 13", 3, 1499.99, "Silver", 16));
    devices.push_back(new Laptop("Apple", "MacBook Pro", 7, 1999.99, "Space Gray", 32));
    devices.push_back(new Tablet("Samsung", "Galaxy Tab S7", 8, 599.99, "Mystic Silver", "11 inches"));
    devices.push_back(new Tablet("Apple", "iPad Pro", 6, 799.99, "Silver", "12.9 inches"));

    // print the list of devices
    cout << "List of Devices:" << endl;
    for (Device* device : devices) {
        device->print();
        cout << endl;
    }

    // remove devices from the list based on a given criterion
    string manufacturer_to_remove = "Apple";
    auto it = devices.begin();
    while (it != devices.end()) {
        if ((*it)->getManufacturer() == manufacturer_to_remove) {
            delete* it;
            it = devices.erase(it);
        }
        else {
            ++it;
        }
    }

    // print the updated list of devices
    cout << "List of Devices (after removing " << manufacturer_to_remove << "):" << endl;
    for (Device* device : devices) {
        device->print();
        cout << endl;
    }

    // search for devices based on a given criterion
    string model_to_find = "Galaxy S21";
    bool found_device = false;
    for (Device* device : devices) {
        if (device->getModel() == model_to_find) {
            cout << "Found device:" << endl;
            device->print();
            found_device = true;
            break;
        }
    }
    if (!found_device) {
        cout << "Device not found." << endl;
    }

    // free memory allocated for devices
    for (Device* device : devices) {
        delete device;
    }

    return 0;
}