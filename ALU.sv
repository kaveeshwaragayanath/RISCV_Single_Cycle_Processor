module ALU (
    input logic [31:0] SrcA,
    input logic [31:0] SrcB,
    input logic [3:0] Operation,
    output logic [31:0] ALUResult,
    output logic negative,
    output logic zero
);

    always_comb begin
        ALUResult = 'd0;
        negative = 'b0;
        zero = 'b0;

        case (Operation)
            4'b0000: ALUResult = SrcA & SrcB;
            4'b0001: ALUResult = SrcA | SrcB;
            4'b0011: ALUResult = SrcA ^ SrcB;
            4'b0010: ALUResult = SrcA + SrcB;
            4'b0110: begin
                ALUResult = SrcA - SrcB;
                negative = (ALUResult < 'd0);
                zero = (ALUResult == 'd0);
            end
            default: ALUResult = 'b0;
        endcase
    end

endmodule
