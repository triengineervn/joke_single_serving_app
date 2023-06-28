// Algorithm test

// Author: Nguyen Minh Tri

// Mini-Max Sum

// Given five positive integers, find the minimum and maximum values that can be calculated by summing
// exactly four of the five integers. Then print the respective minimum and maximum values as a single line
// of two space-separated long integers.
// For example arr = [1, 3, 5, 7, 9], . Our minimum sum is 1 + 3 + 5 + 7 = 16 and our maximum sum is 3 + 5 + 7 + 9 = 24

// We would print
// 16 24

// // Function Description
// Complete the miniMaxSum function in the editor below. It should print two space-separated integers on
// one line: the minimum sum and the maximum sum of 4 of 5 elements.

// miniMaxSum has the following parameter(s): arr: an array of 5 intergers

// Input format
// A single line of five space-separated intergrs

// Output format
// Print two space-separated long integers denoting the respective minimum and maximum values that can
// be calculated by summing exactly four of the five integers. (The output can be greater than a 32 bit
// integer.)
// Simple input
// 1 2 3 4 5
// Simple input
// 10 14

// Our initial numbers are 1, 2, 3, 4 and 5. We can calculate the following sums using four of the five
// integers:
// 1: If we sum everything except 1, our sum is: 2 + 3 + 4 + 5 = 14
// 2: If we sum everything except 2, our sum is: 1 + 3 + 4 + 5 = 13
// 3: If we sum everything except 3, our sum is: 1 + 2 + 4 + 5 = 12
// 4: If we sum everything except 4, our sum is: 1 + 2 + 3 + 5 = 11
// 5: If we sum everything except 5, our sum is: 1 + 2 + 3 + 4 = 10

// Bouns:
// + Count total of array
// + Find min in array
// + Find max in array
// + Find even elements in array
// + Find odd elements in array

void main() {
  List<int> arr = getInputArray();

  // Sort array in ascending order
  arr.sort();

  // Calculate the minimum and maximum sum of four numbers in the array
  int minSum = arr[0] + arr[1] + arr[2] + arr[3];
  int maxSum = arr[1] + arr[2] + arr[3] + arr[4];

  // Print min and max sum
  printOutputValues(minSum, maxSum);

  // Count total of array
  int total = countTotal(arr);
  print('Total of array: $total');

  // Find min in array
  int min = findMin(arr);
  print('Min value in array: $min');

  // Find max in array
  int max = findMax(arr);
  print('Max value in array: $max');

  // Find even elements in array
  List<int> evenElements = findEvenElements(arr);
  print('Even elements in array: $evenElements');

  // Find odd elements in array
  List<int> oddElements = findOddElements(arr);
  print('Odd elements in array: $oddElements');
}

List<int> getInputArray() {
  print('Input value:');
  List<int> arr = [12, 3, 20, 1, 9];
  print(arr.join(' '));
  return arr;
}

void printOutputValues(int minSum, int maxSum) {
  print('Output value:');
  print('$minSum $maxSum');
}

int countTotal(List<int> arr) {
  int total = 0;
  for (int num in arr) {
    total += num;
  }
  return total;
}

int findMin(List<int> arr) {
  int min = arr[0];
  for (int num in arr) {
    if (num < min) {
      min = num;
    }
  }
  return min;
}

int findMax(List<int> arr) {
  int max = arr[0];
  for (int num in arr) {
    if (num > max) {
      max = num;
    }
  }
  return max;
}

List<int> findEvenElements(List<int> arr) {
  List<int> evenElements = [];
  for (int num in arr) {
    if (num % 2 == 0) {
      evenElements.add(num);
    }
  }
  return evenElements;
}

List<int> findOddElements(List<int> arr) {
  List<int> oddElements = [];
  for (int num in arr) {
    if (num % 2 != 0) {
      oddElements.add(num);
    }
  }
  return oddElements;
}
