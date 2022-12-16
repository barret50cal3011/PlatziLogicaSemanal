#include <iostream>

int solucion(int num1, int num2){
    int sum = num1 + num2;
    int sub = num1 - num2;

    for(int i = sum; i >= 1; i /= 10){
        sub *= 10;
    }

    return sum + sub;
}

int main(){
    int num1_test[] = {5, 21, 6, 21, 99};
    int num2_test[] = {4, 5, 4, 6, 1};

    int res[5];
    for(int i = 0; i < sizeof(res)/sizeof(int); i++){
        res[i] = solucion(num1_test[i], num2_test[i]);

        printf("num1: %d num2: %d\n", num1_test[i], num2_test[i]);
        printf("res: %d \n\n", res[i]);
    }
}