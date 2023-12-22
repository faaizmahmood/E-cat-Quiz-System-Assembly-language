                          include emu8086.inc
org 100h

.data ;---------------------------------------------------------------data part


; menu page
a1 db 10,13,'                   ******************************************$'
a2 db 10,13,'                   **           ---- ECAT TEST ----        **$'
a3 db 10,13,'                   **             1) start test            **$'
a4 db 10,13,'                   **             2) check result          **$'
a5 db 10,13,'                   **             3) Exit                  **$'
a6 db 10,13,'                   ******************************************$'

;q1
q1s db 10,13,'1) What does CPU stand for?$'
q1a db 10,13,'1) Central Processing Unit  2) Computer Processing Unit  3) Central Processor Unit  4) Central Power Unit $'

;q2
q2s db 10,13,'2) Which programming language is often used for web development?$'
q2a db 10,13,'1) Java  2) HTML  3) Python  4) C++ $' 

;q3
q3s db 10,13,'3) What does RAM stand for?$'
q3a db 10,13,'1) Random Access Memory  2) Read-Only Memory  3) Rapid Access Memory  4) Remote Access Memory $'

;q4
q4s db 10,13,'4) In computer networking, what does LAN stand for?$'
q4a db 10,13,'1) Local Area Network  2) Large Area Network  3) Link Access Network  4) Longitudinal Area Network $'

;q5
q5s db 10,13,'5) Which of the following is a type of malware that spreads from one computer to another through removable media?$'
q5a db 10,13,'1) Spyware  2) Worm  3) Trojan Horse  4) Adware$'

;q6
q6s db 10,13,'6) What does HTML stand for in the context of web development?$'
q6a db 10,13,'1) High-Level Text Markup Language  2) High-Level Text Markup Language  3) Hyper Transfer Markup Language  4) HyperText Markup Language$'


;q7
q7s db 10,13,'7) Which file format is commonly used for compressing files and folders?$'
q7a db 10,13,'1) RAR  2) TAR  3) ZIP  4) GZIP$'


;q8
q8s db 10,13,'8) What is the purpose of the Ctrl + Z keyboard shortcut in most applications?$'
q8a db 10,13,'1) Save  2) Redo  3) Undo  4) Cut $'


 
  ;result
r1 db 10,13,'                   ******************************************$'
r2 db 10,13,'                   **           ---- TEST Result ----      **$'
r3 db 10,13,'                   **                                      **$'
r4 db 10,13,'                   **                                      **$'
r5 db 10,13,'                   **                                      **$'
r6 db 10,13,'                   ******************************************$'
 
 

 
menu_choice dw ?

mcq_choice dw ? 
points dw 0

points_checker dw 0


.code  ;---------------------------------------------------------------code part

main proc
   
   mov ax,@data
   mov ds,ax
   
   
   whole_menue_loop:
   
   
   ;---------------------------------------------- menue 
mov ah,9
lea dx,a1
int 21h
lea dx,a2
int 21h
lea dx,a3
int 21h
lea dx,a4
int 21h
lea dx,a5
int 21h
lea dx,a6
int 21h



   menue_choice_loop:
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h


   print 'Enter your Choice: '
   call scan_num 
   
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
    
   mov menu_choice,cx
   
   mov ax,menu_choice
   
   cmp ax,1
   je start_test
   cmp ax,2
   je result_show 
   cmp ax,3
   je exit
  
  
   jmp menue_choice_loop 
   
   
   
  
  start_test:;---------------------------------------------------------------Quiz start      
   
  inc points_checker 
   
   
   ;--------------------------- MCQs # 1 
       
       
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q1s
   int 21h
   printn
   mov ah,9
   lea dx,q1a
   int 21h

       ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;choice
   print 'enter you choice:'

   call scan_num
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,1
   je correct_mcq1    ; equal
   jne false_mcq1     ;not equal 
   
   correct_mcq1:
   
   inc points
   
   false_mcq1: 
   
   
   ;------------------------------ MCQs # 2 
       
       
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q2s
   int 21h
   printn
   mov ah,9
   lea dx,q2a
   int 21h

      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;choice
   print 'enter you choice:'

   call scan_num
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,2
   je correct_mcq2    ; equal
   jne false_mcq2     ;not equal 
   
   correct_mcq2:
   
   inc points
   
   false_mcq2: 
   
   

   
   ;------------------------------ MCQs # 3 
       
       
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q3s
   int 21h
   printn
   mov ah,9
   lea dx,q3a
   int 21h

      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;choice
   print 'enter you choice:'

   call scan_num
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,1
   je correct_mcq3    ; equal
   jne false_mcq3    ;not equal 
   
   correct_mcq3:
   
   inc points
   
   false_mcq3: 
   
   
   ;------------------------------ MCQs # 4 
       
       
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q4s
   int 21h
   printn
   mov ah,9
   lea dx,q4a
   int 21h

      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;choice
   print 'enter you choice:'

   call scan_num
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,1
   je correct_mcq4    ; equal
   jne false_mcq4    ;not equal 
   
   correct_mcq4:
   
   inc points
   
   false_mcq4: 
   
   
   
   ;------------------------------ MCQs # 5 
       
       
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q5s
   int 21h
   printn
   mov ah,9
   lea dx,q5a
   int 21h

      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;choice
   print 'enter you choice:'

   call scan_num
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,1
   je correct_mcq5    ; equal
   jne false_mcq5    ;not equal 
   
   correct_mcq5:
   
   inc points
   
   false_mcq5:
   
  
     
   ;------------------------------ MCQs # 6 
       
       
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q6s
   int 21h
   printn
   mov ah,9
   lea dx,q6a
   int 21h

      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;choice
   print 'enter you choice:'

   call scan_num
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,4
   je correct_mcq6    ; equal
   jne false_mcq6    ;not equal 
   
   correct_mcq6:
   
   inc points
   
   false_mcq6: 
   
   
   ;------------------------------ MCQs # 7 
       
       
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q7s
   int 21h
   printn
   mov ah,9
   lea dx,q7a
   int 21h

      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
;choice
   print 'enter you choice:'

   call scan_num
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,3
   je correct_mcq7    ; equal
   jne false_mcq7    ;not equal 
   
   correct_mcq7:
   
   inc points
   
   false_mcq7:   
   
   
   ;-------------------------------- MCQs # 8 
   
   ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;mcq
   mov ah,9
   lea dx,q8s
   int 21h
   printn
   mov ah,9
   lea dx,q8a
   int 21h
    
    
       ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   
   print 'enter you choice:'
   
   call scan_num
   mov mcq_choice,cx
   
   mov ax,mcq_choice
   cmp ax,3
   je correct_mcq8    ; equal
   jne false_mcq8     ;not equal 
   
   correct_mcq8:
   
   inc points
   
   false_mcq8: 
   
       ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

       ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   
   
   print 'Quiz is ended now return to main menu'
   
   print '      ' 
   
   
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
   
   
   jmp whole_menue_loop 
                        
                      
   
   
    result_show:
 
    ;------------------------------------------------- print result 
    
    
    ; attemp checker
    mov ax, points_checker
    cmp ax,0
    
    jle not_return
    jge cotinue
    
   
  
  cotinue: 
    
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;result    
mov ah,9
lea dx,r1
int 21h
lea dx,r2
int 21h
lea dx,r3
int 21h
lea dx,r4
int 21h
lea dx,r5
int 21h
lea dx,r6
int 21h
    
    mov ax, points
          ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h


    print 'total questions are: 8'
          ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
    print 'your correct answers are: '
    mov ax,points
    call print_num
    
    mov ax,points
    cmp ax,4
    jge pass
    jl fail
    
    pass:
    
           ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
 print 'congratulations you passed'
 
 
 jmp main_menue_returing_res
     
    fail:
    
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h


     print 'unfortunately you are fail'
     
      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

      ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
         
   main_menue_returing_res:
   
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h      
   print 'Quiz is ended now return to main menu...'
   
   print '      ' 
   
         ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h




   

jmp whole_menue_loop 


not_return:  

print 'you do not attemt the quiz please first attemp the quiz then check the result :)'

   
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h      
   print 'Quiz is return to main menu...'
   
   print '      ' 
   
         ;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h 

jmp whole_menue_loop 
    

; --------------------------------------------------- exit
    
    exit:
    
    print 'Thanks!'
    
    
    main endp 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM
end main