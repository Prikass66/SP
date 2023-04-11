#include <iostream>

int main() 
{
    int arr[] = {63, 12, 130, 11923, 93, 29, 131, 222, 3352, 543234}; // исходный массив
    int sum = 0;

    for (int i = 0; i < sizeof(arr)/sizeof(arr[0]); i++) 
    {
        if ((arr[i] & 0x80) == 0x80) { // проверяем 7-й бит
            arr[i] = arr[i] >> 1; // сдвигаем вправо на 1 разряд
        }
        sum += arr[i]; // добавляем элемент к сумме
    }

    std::cout << "Сумма элементов массива: " << sum << std::endl;

    return 0;
}
