# Arithmetic Logic Unit

 1. Hardware implementation in system verilog of a simple arithmetic logic unit (ALU) of 6 bits and 16 operations

![Figure](https://github.com/roscibely/arithmetic-logic-unit/blob/master/ula.jpg)


• Inputs: Operating A (6bits), Operating B (6bits), Reset, Clock, Mode Selection (Arithmetic or Logical), Operation Selection (3bits).

• Outputs: Output ALU (6bits), Carryout, Zero

The ALU outlined in the block diagram has two input operands (operands A and B) of 6 bits each. In addition, the ALU also has input signals Reset, Clock, Operation Selection and Mode. The Reset signal clears all ALU outputs. The Clock signal sets the clock of the ALU. The Mode Selection signal indicates whether the ALU will perform a logical operation or whether to perform an arithmetic operation.


The ALU uses the notation two's complement which is the most commonly used to represent signed numbers on computers. As the operands input contains 6 bits, it will be possible to represent 2^6 = 64 numbers (negative and positive).
