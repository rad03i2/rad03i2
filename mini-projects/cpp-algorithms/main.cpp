#include <algorithm>
#include <iostream>
#include <vector>

int binarySearch(const std::vector<int>& values, int target) {
    int left = 0;
    int right = static_cast<int>(values.size()) - 1;

    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (values[mid] == target) return mid;
        if (values[mid] < target) left = mid + 1;
        else right = mid - 1;
    }

    return -1;
}

int main() {
    std::vector<int> numbers = {42, 7, 13, 99, 5, 18, 31};
    std::sort(numbers.begin(), numbers.end());

    std::cout << "Sorted numbers: ";
    for (int number : numbers) {
        std::cout << number << " ";
    }

    int target = 18;
    int index = binarySearch(numbers, target);
    std::cout << "\nTarget " << target << " found at index: " << index << "\n";

    return 0;
}
