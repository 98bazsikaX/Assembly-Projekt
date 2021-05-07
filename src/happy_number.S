.syntax unified

.text


// x^2 fuggveny
//.global square
//Behelyettesitve a fuggvenybe sebesseg miatt 65k-ig 0,422s-bol lett 0,39s
//square:
    //push {r4-r11,lr}
    //mul r0,r0,r0
    //pop {r4-r11,pc}
    //b after_square


// x%10 fuggveny
//.global modulo
//siman cimke lett h gyorsabb legyen a program
modulo:
    //push {r4-r11,lr}
//modulo_asd:
    cmp r0,#10
    blo ret_from_modulo
    sub r0,r0,#10
    b modulo
ret_from_modulo:
    //pop {r4-r11,pc}
    b after_modulo

.global is_happy_number
is_happy_number:
    push {r4-r11,lr}
    mov r1,r0
    //r1 num , r2 a j, r3 a sum 
    mov r3,0//biztonsag kedveert
    cmp r0,#1 //teszt h ne legyen fagyas
    ble equals

outer:
    cmp r3,#1
    beq outer_end
    cmp r3,#4
    beq outer_end
    

    mov r3,#0
inner:
    cmp r1,#0
    bls inner_end
    mov r0,r1
    b modulo
after_modulo:
    //mov r0,r0
    //mov r2,r0 kommentelve mivel utana square hivas
    mul r0,r0,r0 //square function    
    add r3,r3,r0
    mov r4,#10
    udiv r1,r1,r4
    bl inner

inner_end:
    mov r1,r3
    bl outer
    
outer_end:
    cmp r3,#1
    bne equals

    mov r0,1
    bl happy_ending

equals:
    mov r0,0


happy_ending:

    pop {r4-r11,pc}
