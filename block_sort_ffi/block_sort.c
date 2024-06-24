#include <stdio.h>
#include <stdlib.h>

void block_sort(int* arr, int n) {
    int block_size = 10; // You can adjust the block size as needed
    int* buffer = (int*)malloc(n * sizeof(int));
    if (!buffer) {
        fprintf(stderr, "Memory allocation failed\n");
        return;
    }

    for (int start = 0; start < n; start += block_size) {
        int end = start + block_size;
        if (end > n) end = n;
        for (int i = start; i < end; ++i) {
            for (int j = i + 1; j < end; ++j) {
                if (arr[i] > arr[j]) {
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
    }

    free(buffer);
}
