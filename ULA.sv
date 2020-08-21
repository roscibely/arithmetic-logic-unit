module ULA(input clock, reset, modo, input logic [2:0]op, input logic [5:0]A, input logic [5:0]B, output logic [5:0]resultado, output carryout, zero);
		wire [5:0] C =~B;
		always_ff @(posedge clock) begin		
			if(~reset) begin
				resultado = 6'b000000;
				carryout = 0;
				zero = 0;
			end
			else begin
				if(~modo) begin
					case(op) 
						3'b000: begin 
							resultado = A + B;
							if((A[5]==1 & B[5]==1 & resultado[5]==0) | (A[5]==0 & B[5]==0 & resultado[5]==1))
								carryout<=1;
							else carryout<=0;
						end
						3'b001: begin 
							resultado = A - B;
							if((A[5]==0 & B[5]==1 & resultado[5]==1) | (A[5]==1 & B[5]==0 & resultado[5]==0))
								carryout<=1;
							else carryout<=0;	
						end
						3'b010: begin 
							resultado = A + C;
							if((A[5]==1 & C[5]==1 & resultado[5]==0) | (A[5]==0 & C[5]==0 & resultado[5]==1))
								carryout<=1;
							else carryout<=0;
						end		
						3'b011: begin 
							resultado = A - C; 
							if((A[5]==0 & C[5]==1 & resultado[5]==1) | (A[5]==1 & C[5]==0 & resultado[5]==0))
								carryout<=1;
							else carryout<=0;	
						end
						3'b100: begin 
							resultado = A + 6'b000001;
							if(A[5]==0 & resultado[5]==1)
								carryout<=1;
							else carryout<=0;
						end 
						3'b101: begin 
							resultado = A - 6'b000001;
							if(A[5]==1 & resultado[5]==0)
								carryout<=1;
							else carryout<=0;
						end
						3'b110: begin 
							resultado = B + 6'b000001; 
							if(B[5]==0 & resultado[5]==1)
								carryout<=1;
							else carryout<=0;
						end
						3'b111: begin 
							resultado = B - 6'b000001; 
							if(B[5]==1 & resultado[5]==0)
								carryout<=1;
							else carryout<=0;
						end
					endcase
				end
				else begin 
					carryout<=0;
					case(op) 
						3'b000: resultado = A & B;
						3'b001: resultado = ~A; 
						3'b010: resultado = ~B;		
						3'b011: resultado = A | B; 
						3'b100: resultado = A ^ B; 
						3'b101: resultado = ~(A & B);
						3'b110: resultado = A;
						3'b111: resultado = B;
					endcase
					
				end
			end
			if(resultado==0) zero=1;
			else zero=0;
		end
endmodule 