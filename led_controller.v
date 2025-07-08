module led_controller(
    input wire clk,
    input wire rst,
    input wire btn_clean,
    input wire tick, // from clk_divider
    output reg led
);
    reg led_on; // whether LED should blink or stay off

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led_on <= 0;
            led <= 0;
        end else begin
            if (btn_clean) begin
                led_on <= ~led_on; // toggle mode
            end
            if (led_on) begin
                if (tick) begin
                    led <= ~led; // blink
                end
            end else begin
                led <= 0;
            end
        end
    end
endmodule
