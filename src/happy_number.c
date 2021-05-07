#include <stdio.h>



extern int is_happy_number(int num);
extern int modulo(int num);
extern int square(int num);
//arm-linux-gnueabihf-gcc -static -mcpu=cortex-a7 -marm happy_number.c happy_number.s
//qemu-arm-static a.out

int isHappy(int num){
  int j,sum=0;
  while(sum!=1 && sum!=4){ //outer
    sum=0;
    while(num>0){//inner
        j=num%10;
        sum+=(j*j);
        num=num/10; 
    }//inner_end
  num=sum;
  }//outer_end
 return (sum==1)?1:0;
}


int main(){
  //isHappy(1);
  printf("%d\n",is_happy_number(3000000000));
   /* for(int i = 10;i<500000;++i){
    if(is_happy_number(i)!=isHappy(i)){
      printf("HIBA!");
    }
  }       */
    return 0;
}