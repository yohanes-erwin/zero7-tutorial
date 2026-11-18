`timescale 1ns / 1ps

module top_nn_tb();
    localparam T = 50; // 50ns
    
    reg clk;
    reg rst_n;
    reg btn_start_n;
    
    top_nn dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .btn_start_n(btn_start_n),
        .led_r(),
        .led_g(),
        .led_b()
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
        // Initial values
        btn_start_n = 1;
        
        // Reset
        rst_n = 0;
        #(T*10);
        rst_n = 1;
        #(T*10);
        
        // Button bouncing test
        btn_start_n = 0;
        #(T*400);
        btn_start_n = 1;
        #(T*200);
        btn_start_n = 0;
        #(T*500);
        btn_start_n = 1;
        #(T*100);
        btn_start_n = 0;
        #(T*2000);
        btn_start_n = 1;
        #(T*1000);
        
        // Button pressed
        #(T*100);
        btn_start_n = 0;
        #(T*800000);
        btn_start_n = 1;
        #(T*200000);
        
        // Reset
        rst_n = 0;
        #(T*10);
        rst_n = 1;
        #(T*10);
        
        // Button pressed
        #(T*100);
        btn_start_n = 0;
        #(T*800000);
        btn_start_n = 1;
        #(T*200000);
        
        // Reset
        rst_n = 0;
        #(T*10);
        rst_n = 1;
        #(T*10);
        
        // Button pressed
        #(T*100);
        btn_start_n = 0;
        #(T*800000);
        btn_start_n = 1;
        #(T*200000);
    end
    
endmodule
