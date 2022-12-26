@B092040016 陳昱逢

TEX:
    .text
    .align 2 @align 4 byte
    .global main
main:

    @prologue
    stmfd  sp! , {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,fp,lr}
    @add	fp, sp, #4
    
    @code body
    
    @r4:r0-1 , r5:r1(arr) , r6:i , r7:j , r8:max(string)  r9:maxIndex   r10:arr[j]
    sub  r0,r0,#1
    mov  r4,r0
    mov  r5,r1
    mov  r6,#0

    ldr r0,= string1
    bl printf

    LOOP:   
            add  r6 , r6 , #1
            mov  r9 , r6     @maxIndex=i
            cmp  r6 , r4 @n times
            bgt  EXIT
            
            mov  r7,#0
    LOOP2:  
            
            add  r7 , r7 , #1   @r7:1
            cmp  r7 , r4
            bgt  coverandprint
            
            ldr  r0 , [r5,r9,LSL #2]
            bl   atoi
            mov  r8 , r0
            
            ldr  r0, [r5,r7,LSL #2]  @r5+r7*4
            bl   atoi
            mov  r10 , r0
            
            cmp  r10 , r8       
            ble  LOOP2
            mov  r9 , r7  @maxIndex=j
            b   LOOP2


    coverandprint:   
            ldr  r0 , [r5,r9,LSL #2]  @r0=a[maxIndex]  maybe mov ro,r8
            bl   atoi
            mov  r1,r0
            ldr  r0,= string2
            bl   printf


            ldr  r1 ,= string3
            str  r1 , [r5,r9,LSL #2]
            
            
            b   LOOP

    EXIT:

    ldmfd  sp! , {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,fp,lr}
    bx   lr
    
    string1:
    .ascii "Sorting result is : \0"

    string2:
    .asciz "%d "
    string3:
    .asciz "-999"

    
    .end

                        