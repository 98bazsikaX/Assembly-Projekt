#include <stdio.h>

extern int is_happy_number(int num);

int main(){
    int num;

    printf("Kerem adjon meg egy szamot: ");
    scanf("%d",&num);

    printf(is_happy_number(num)==1?("\nBoldog szam\n"):("\nBoldogtalan szam :( \n"));

}