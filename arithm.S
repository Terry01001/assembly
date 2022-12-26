@B092040016 ³¯¬R³{

TEX:
    .text
    .align 2 @align 4 byte
    .global main
main:
    @prologue
    stmfd  sp! , {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,lr}
    @code body
    @mov r4,r0
    mov r5,r1

    @r4:numAornumB; r5:r1; r6:byte; r7: r8:boolofA r9:boolofB 
    mov r8,#0
    mov r9,#0


    @judge first parameter A
    ldr r4,[r5,#4]
        loopinjudgeA:
            ldrb r6,[r4],#1
            cmp r6,#0
            beq B
            sub r6,r6,#'0'
            cmp r6,#0
            movlt r8,#1
            blt B
            cmp r6,#9
            movgt r8,#1
            bgt B
            b loopinjudgeA
    
    @judge second parameter B
    B:
        ldr r4,[r5,#8]
        loopinjudgeB:
            ldrb r6,[r4],#1
            cmp r6,#0
            beq WhetherInvalid
            sub r6,r6,#'0'
            cmp r6,#0
            movlt r9,#1
            blt WhetherInvalid
            cmp r6,#9
            movgt r9,#1
            bgt WhetherInvalid
            b loopinjudgeB

    WhetherInvalid:
        cmp r8,#1
        beq Invalid
        cmp r9,#1
        beq Invalid
        
        bne Calculate

    Invalid:
        ldr r0,= string1
        bl printf
        cmp r8,#1
        cmpeq r9,#0
        beq eight

        cmp r8,#1
        cmpeq r9,#1
        beq eightnine

        cmp r8,#0
        cmpeq r9,#1
        beq nine

    eight:
        ldr r0,[r5,#4]
        bl printf
        b EXIT
    eightnine:
        ldr r0,[r5,#4]
        bl printf
        ldr r0,= string2
        bl printf
        ldr r0,[r5,#8]
        bl printf
        b EXIT
    nine:
        ldr r0,[r5,#8]
        bl printf
        b EXIT

    
    Calculate:
        adr r7,SWITCH
        mov r0,#12
        bl convertstringtoint

        mov r4,r0
        cmp r4,#8
        ldrls pc,[r7,r4,LSL #2]
        B EXIT

    SWITCH: .word CAL0
            .word CAL1
            .word CAL2
            .word CAL3
            .word CAL4
            .word CAL5
            .word CAL6
            .word CAL7
            .word CAL8
    @ r6:output
    CAL0:
        mov r0,#4
        bl convertstringtoint
        mov r6,r0
        mov r0,#8
        bl convertstringtoint
        add r6,r6,r0
        
        ldr r0,= string4
        bl printf
        mov r0,#12
        bl convertstringtoint
        mov r1,r0
        ldr r0,= string3
        bl printf
        ldr r0,= str0
        bl printf
        ldr r0,[r5,#4]
        bl printf
        ldr r0,= string5
        bl printf
        ldr r0,[r5,#8]
        bl printf
        ldr r0,= string6
        bl printf
        mov r1,r6
        ldr r0,= string3
        bl printf
        ldr r0,= string7
        bl printf

        b EXIT
    CAL1:
        mov r0,#4
        bl convertstringtoint
        mov r6,r0
        mov r0,#8
        bl convertstringtoint
        sub r6,r6,r0
        
        ldr r0,= string4
        bl printf
        mov r0,#12
        bl convertstringtoint
        mov r1,r0
        ldr r0,= string3
        bl printf
        ldr r0,= str1
        bl printf
        ldr r0,[r5,#4]
        bl printf
        ldr r0,= string5
        bl printf
        ldr r0,[r5,#8]
        bl printf
        ldr r0,= string6
        bl printf
        mov r1,r6
        ldr r0,= string3
        bl printf
        ldr r0,= string7
        bl printf

        b EXIT
    @r6:result(output);r4:A;r7:counter(move 32 bits)
    CAL2:
        mov r0,#4
        bl convertstringtoint
        mov r4,r0
        mov r6,#0
        mov r7,#32

        reverse:
            mov r6,r6,LSL #1
            
            rrxs r4,r4
            @mov r4,r4,rrx
            orrcs r6,r6,#1
            sub r7,r7,#1
            cmp r7,#0
            bne reverse

        ldr r0,= string4
        bl printf
        mov r0,#12
        bl convertstringtoint
        mov r1,r0
        ldr r0,= string3
        bl printf
        ldr r0,= str2
        bl printf
        ldr r0,[r5,#4]
        bl printf
        
        ldr r0,= string6
        bl printf
        mov r1,r6
        ldr r0,= string3
        bl printf
        ldr r0,= string7
        bl printf
 
        b EXIT
    @r6:a;r7:flag(output);r4:b
    CAL3:
        mov r0,#4
        bl convertstringtoint
        mov r6,r0
        mov r0,#8
        bl convertstringtoint
        mov r4,r0
        
        mov r7,#0
        div:
            cmp r6,r4
            blt out
            sub r6,r6,r4
            add r7,r7,#1
            b div

        out:
            ldr r0,= string4
            bl printf
            mov r0,#12
            bl convertstringtoint
            mov r1,r0
            ldr r0,= string3
            bl printf
            ldr r0,= str3
            bl printf
            ldr r0,[r5,#4]
            bl printf
            ldr r0,= string5
            bl printf
            ldr r0,[r5,#8]
            bl printf
            ldr r0,= string6
            bl printf
            mov r1,r7   @r7:flag(output)
            ldr r0,= string3
            bl printf
            ldr r0,= string7
            bl printf 
            
        b EXIT
    CAL4:
        mov r0,#4
        bl convertstringtoint
        mov r6,r0
        mov r0,#8
        bl convertstringtoint
        mov r4,r0

        ldr r0,= string4
        bl printf
        mov r0,#12
        bl convertstringtoint
        mov r1,r0
        ldr r0,= string3
        bl printf
        ldr r0,= str4
        bl printf
        ldr r0,[r5,#4]
        bl printf
        ldr r0,= string5
        bl printf
        ldr r0,[r5,#8]
        bl printf
        ldr r0,= string6
        bl printf

        cmp r6,r4
        movge r1,r6
        movlt r1,r4

        ldr r0,= string3
        bl printf
        ldr r0,= string7
        bl printf

        b EXIT
    @r6:output r4:A r7:B r8:temp
    CAL5:
        mov r0,#4
        bl convertstringtoint
        mov r4,r0
        mov r0,#8
        bl convertstringtoint
        mov r7,r0

        mov r8,r4   @r8:temp
        mov r6,r4
        exp:
            cmp r7,#1
            ble out2
            mul r6,r8,r4
            mov r8,r6
            sub r7,r7,#1
            b exp

        out2:
            ldr r0,= string4
            bl printf
            mov r0,#12
            bl convertstringtoint
            mov r1,r0
            ldr r0,= string3
            bl printf
            ldr r0,= str5
            bl printf
            ldr r0,[r5,#4]
            bl printf
            ldr r0,= string5
            bl printf
            ldr r0,[r5,#8]
            bl printf
            ldr r0,= string6
            bl printf
            mov r1,r6
            ldr r0,= string3
            bl printf
            ldr r0,= string7
            bl printf
 
        b EXIT
    @r6:A,r4:B
    CAL6:
        mov r0,#4
        bl convertstringtoint
        mov r6,r0
        mov r0,#8
        bl convertstringtoint
        mov r4,r0

        gcd:
            cmp r6,r4
            beq out3
            subgt r6,r6,r4
            sublt r4,r4,r6
            b gcd
        out3:
            ldr r0,= string4
            bl printf
            mov r0,#12
            bl convertstringtoint
            mov r1,r0
            ldr r0,= string3
            bl printf
            ldr r0,= str6
            bl printf
            ldr r0,[r5,#4]
            bl printf
            ldr r0,= string5
            bl printf
            ldr r0,[r5,#8]
            bl printf
            ldr r0,= string6
            bl printf
            mov r1,r6
            ldr r0,= string3
            bl printf
            ldr r0,= string7
            bl printf
            
        b EXIT
    CAL7:
        mov r0,#4
        bl convertstringtoint
        mov r8,r0
        mov r0,#8
        bl convertstringtoint
        mul r6,r8,r0

        ldr r0,= string4
        bl printf
        mov r0,#12
        bl convertstringtoint
        mov r1,r0
        ldr r0,= string3
        bl printf
        ldr r0,= str7
        bl printf
        ldr r0,[r5,#4]
        bl printf
        ldr r0,= string5
        bl printf
        ldr r0,[r5,#8]
        bl printf
        ldr r0,= string6
        bl printf
        mov r1,r6
        ldr r0,= string3
        bl printf
        ldr r0,= string7
        bl printf
        
        b EXIT
    @r6:A,gcd;r4:B,gcd,B;r8:A,A/gcd;r7:flag
    CAL8:
        mov r0,#4
        bl convertstringtoint
        mov r6,r0
        mov r0,#8
        bl convertstringtoint
        mov r4,r0

        lcm:
            cmp r6,r4
            beq lcm2
            subgt r6,r6,r4
            sublt r4,r4,r6
            b lcm

        lcm2:
            mov r0,#4
            bl convertstringtoint
            mov r8,r0
            mov r0,#8
            bl convertstringtoint
            mov r4,r0

            mov r7,#0
            divforlcmA:
                cmp r8,r6
                movlt r8,r7
                blt calculateandoutput
                sub r8,r8,r6
                add r7,r7,#1
                b divforlcmA

            
            @r10:outcome(output)
            calculateandoutput:
                mul r10,r8,r4

                ldr r0,= string4
                bl printf
                mov r0,#12
                bl convertstringtoint
                mov r1,r0
                ldr r0,= string3
                bl printf
                ldr r0,= str8
                bl printf
                ldr r0,[r5,#4]
                bl printf
                ldr r0,= string5
                bl printf
                ldr r0,[r5,#8]
                bl printf
                ldr r0,= string6
                bl printf
                mov r1,r10
                ldr r0,= string3
                bl printf
                ldr r0,= string7
                bl printf

        b EXIT

    @my func convert string to int
    @r1:stringtype,r2:outcome
    convertstringtoint:
        @mov r8,r0
        ldr r1,[r5,r0]
        mov r2,#0
        mov r3,#10

        loopinconversion:
            ldrb r12,[r1],#1
            cmp r12,#0
            moveq r0,r2
            moveq pc,lr
            
            subne r12,r12,#'0'
            mulne r0,r2,r3
            addne r2,r0,r12

            bne loopinconversion

    
    EXIT:
        
        ldmfd  sp! , {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,lr}
        bx   lr
    
    string1:
    .ascii "Invalid input opernads:\0"

    string2:
    .ascii ",\0"

    string3:
    .asciz "%d"
    
    string4:
    .ascii "Function \0"

    string5:
    .ascii " and \0"

    string6:
    .ascii " is \0"

    string7:
    .ascii ".\0"
    
    str0:
    .ascii ": addition of \0"

    str1:
    .ascii ": substraction of \0"

    str2:
    .ascii ": Bit-reverse of \0"

    str3:
    .ascii ": division of \0"

    str4:
    .ascii ": maximum of \0"

    str5:
    .ascii ": exponent of \0"

    str6:
    .ascii ": greatest common divisor of \0"

    str7:
    .ascii ": multiplication of \0"

    str8:
    .ascii ": least common mulitply of \0"
    
    stringtest:
    .ascii "testing: \0"
    .end
    