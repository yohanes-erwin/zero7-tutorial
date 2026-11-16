`timescale 1ns / 1ps

module blink_tb();
    localparam T = 50; // 20Mhz
    
    reg clk;
    reg rst_n;
    wire led;
    
    blink dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .led(led)
    );
    
    always
    begin
        clk = 0;
        #(T/2);
        clk = 1;
        #(T/2);
    end
    
    initial
    begin
        rst_n = 0;
        #(T*10);
        rst_n = 1;
        #(T*10);
    end
    
endmodule
