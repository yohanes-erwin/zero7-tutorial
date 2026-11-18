`timescale 1ns / 1ps

module top_nn
    (
        input  wire clk,
        input  wire rst_n,
        input  wire btn_start_n,
        output wire led_r,
        output wire led_g,
        output wire led_b
    );
    
    wire btn_start;
    wire btn_db;
    reg btn_db_reg;
    wire btn_db_tick;
    reg [3:0] state_reg, state_next;
    reg led_r_reg, led_r_next;
    wire nn_ready, nn_done;
    reg nn_a_enb_reg, nn_a_enb_next;
    reg [1:0] nn_a_addrb_reg, nn_a_addrb_next;
    wire [63:0] nn_a_doutb;
    reg is_word_0_correct_reg, is_word_1_correct_reg;
            
    // Invert button logic from active low to active high
    assign btn_start = !btn_start_n;

    // Button debounding module
    debouncing debouncing_0
    (
        .clk(clk),
        .rst_n(rst_n),
        .sw(btn_start),
        .db(btn_db)
    );
    
    // Rising edge detector
    always @(posedge clk)
    begin
        if (!rst_n)
            btn_db_reg <= 0;
        else
            btn_db_reg <= btn_db;
    end
    assign btn_db_tick = btn_db & !btn_db_reg;
    
    // Top level FSM
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            state_reg <= 0;
            led_r_reg <= 1;
            nn_a_enb_reg <= 0;
            nn_a_addrb_reg <= 0;
        end
        else
        begin
            state_reg <= state_next;
            led_r_reg <= led_r_next;
            nn_a_enb_reg <= nn_a_enb_next;
            nn_a_addrb_reg <= nn_a_addrb_next;
        end
    end
    always @(*)
    begin
        state_next = state_reg;
        led_r_next = led_r_reg;
        nn_a_enb_next = nn_a_enb_reg;
        nn_a_addrb_next = nn_a_addrb_reg;
        case (state_reg)
            0: // Wait for button press
            begin
                if (btn_db_tick)
                begin
                    state_next = 1;
                    led_r_next = 0;
                end
            end
            1: // Wait for done signal from NN
            begin
                if (nn_done)
                begin
                    state_next = 2;
                end
            end
            2: // Set address and enable for reading word 0 from BRAM output
            begin
                state_next = 3;
                nn_a_enb_next = 1;
                nn_a_addrb_next = 0;
            end
            3: // Set address and enable for reading word 1 from BRAM output
            begin
                state_next = 4;
                nn_a_enb_next = 1;
                nn_a_addrb_next = 1;
            end
            4: // Output data word 0 available
            begin
                state_next = 5;
                nn_a_enb_next = 0;
                nn_a_addrb_next = 0;
            end
            5: // Output data word 1 available
            begin
                state_next = 0;
            end
        endcase
    end
    
    // NN core
    nn nn_0
    (
        .clk(clk),
        .rst_n(rst_n),
        .en(1),
        .clr(0),
        .ready(nn_ready),
        .start(btn_db_tick),
        .done(nn_done),
        .wb_ena(0),
        .wb_addra(0),
        .wb_dina(0),
        .wb_wea(0),
        .k_ena(0),
        .k_addra(0),
        .k_dina(0),
        .k_wea(0),
        .a_enb(nn_a_enb_reg),
        .a_addrb(nn_a_addrb_reg),
        .a_doutb(nn_a_doutb)
    );
    
    // Result checking by comparing the data in output BRAM with expected value
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            is_word_0_correct_reg <= 0;
        end
        else if ((state_reg == 4) && (nn_a_doutb == 64'h0014002b002b03a8)) // Expected value for word 0
        begin
            is_word_0_correct_reg <= 1;
        end
    end
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            is_word_1_correct_reg <= 0;
        end
        else if ((state_reg == 5) && (nn_a_doutb == 64'h03e803cf03cf004d)) // Expected value for word 1
        begin
            is_word_1_correct_reg <= 1;
        end
    end
    
    // Output to LED
    assign led_r = led_r_reg;
    assign led_g = is_word_0_correct_reg;
    assign led_b = is_word_1_correct_reg;
    
endmodule
