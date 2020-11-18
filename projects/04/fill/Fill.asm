(KBDLOOP)
  @i
  M=0
  @KBD
  D=M
  @BLACK_SCREEN_LOOP // black loop when pressed
  D;JNE
  @WHITE_SCREEN_LOOP // white loop when NOT pressed
  D;JEQ

(BLACK_SCREEN_LOOP)
  @i
  D=M
  @24575
  D=D-A
  @END
  D;JGT

  @i
  D=M

  @SCREEN
  A=A+D
  M=-1

  @i
  M=M+1

  // check if key is still pressed. 
  @KBD
  D=M
  @KBDLOOP 
  D;JEQ // key no longer pressed.
  @BLACK_SCREEN_LOOP
  0;JMP // continue
(END)

(WHITE_SCREEN_LOOP)
  @i
  D=M
  @24575
  D=D-A
  @END
  D;JGT

  @i
  D=M

  @SCREEN
  A=A+D
  M=0

  @i
  M=M+1

  // check if key is still not pressed. 
  @KBD
  D=M
  @KBDLOOP
  D;JNE // key is pressed
  @WHITE_SCREEN_LOOP
  0;JMP
(END)