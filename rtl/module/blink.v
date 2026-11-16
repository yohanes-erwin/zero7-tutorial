`timescale 1ns / 1ps

module blink
    (
        input  wire clk,
        input  wire rst_n,
        output wire led
    );
    
    reg [31:0] cnt_reg;
    reg led_reg;
    
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            cnt_reg <= 0;
            led_reg <= 0;        
        end
        else if (cnt_reg >= 10000000-1) // 20Mhz = 50ns. 50ns * 10000000 = 0.5s
        begin
            cnt_reg <= 0;
            led_reg <= ~led_reg; // Blink every 0.5s
        end
        else
        begin
            cnt_reg <= cnt_reg + 1;
            led_reg <= led_reg;
        end
    end
    
    assign led = led_reg;
    
endmodule
