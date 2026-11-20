// Taken from this book: FPGA Prototyping by Verilog Examples: Xilinx Spartan-3 Version
`timescale 1ns / 1ps

module debouncing
    (
        input  wire clk,
        input  wire rst_n,
        input  wire sw,
        output reg  db
    );

    localparam [2:0] zero    = 3'b000,
                     waitl_1 = 3'b001,
                     waitl_2 = 3'b010,
                     waitl_3 = 3'b011,
                     one     = 3'b100,
                     wait0_1 = 3'b101,
                     wait0_2 = 3'b110,
                     wait0_3 = 3'b111;
    // Number of counter bits (2^N * 50ns = ~13ms tick)
    localparam N = 18;
    
    reg [N-1:0] q_reg;
    wire [N-1:0] q_next;
    wire m_tick;
    reg [2:0] state_reg, state_next; 
    
    // Counter to generate ~13 ms tick
    always @(posedge clk)
        if (!rst_n)
            q_reg <= 0;
        else
            q_reg <= q_next;
    assign q_next = q_reg + 1;
    assign m_tick = (q_reg == 0) ? 1'b1 : 1'b0;
    
    // Debouncing FSM
    always @(posedge clk)
        if (!rst_n)
            state_reg <= zero;
        else
            state_reg <= state_next;
    always @*
    begin
        state_next = state_reg;
        db = 1'b0;
        case (state_reg)
            zero:
                if (sw)
                    state_next = waitl_1;
            waitl_1:
                if (~sw)
                    state_next = zero;
                else
                    if (m_tick)
                        state_next = waitl_2;
            waitl_2:
                if (~sw)
                    state_next = zero;
                else
                    if (m_tick)
                        state_next = waitl_3;    
            waitl_3:
                if (~sw)
                    state_next = zero;
                else
                    if (m_tick)
                        state_next = one;  
            one:
            begin
                db = 1'b1;
                if (~sw)
                    state_next = wait0_1;
            end 
            wait0_1:
            begin
                db = 1'b1;
                if (sw)
                    state_next = one;
                else
                    if (m_tick)
                        state_next = wait0_2;
            end   
            wait0_2:
            begin
                db = 1'b1;
                if (sw)
                    state_next = one;
                else
                    if (m_tick)
                        state_next = wait0_3;
            end     
            wait0_3:
            begin
                db = 1'b1;
                if (sw)
                    state_next = one;
                else
                    if (m_tick)
                        state_next = zero;
            end
            default:
                state_next = zero;    
        endcase
    end
    
endmodule
