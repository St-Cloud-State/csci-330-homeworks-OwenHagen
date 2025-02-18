#include <iostream>
#include <stack>
#include <vector>
#include <algorithm>

using namespace std;

// Partition function
int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
        if (arr[j] <= pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return i + 1;
}

// Iterative Quicksort
void quickSort(vector<int>& arr) {
    stack<pair<int, int>> s;
    s.push({0, arr.size() - 1});

    while (!s.empty()) {
        int low = s.top().first;
        int high = s.top().second;
        s.pop();

        if (low < high) {
            int p = partition(arr, low, high);
            s.push({low, p - 1});
            s.push({p + 1, high});
        }
    }
}

int main() {
    vector<int> arr = {10, 7, 8, 9, 1, 5};
    quickSort(arr);
    cout << "Sorted array: ";
    for (int num : arr) {
        cout << num << " ";
    }
    cout << endl;
    return 0;
}
