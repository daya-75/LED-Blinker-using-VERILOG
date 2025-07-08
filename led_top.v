module led_top (
    input wire clk,
    input wire rst,
    input wire btn,
    output wire led
);
    wire btn_clean;
    wire tick_2Hz;
    debouncer u_debouncer (
        .clk(clk),
        .rst(rst),
        .noisy_in(btn),
        .clean_out(btn_clean)
    );

clk_divider_2Hz u_div2 (
    .clk(clk),
    .rst(rst),
    .tick(tick_2Hz)
);
    led_controller u_led_controller (
        .clk(clk),
        .rst(rst),
        .btn_clean(btn_clean),
        .tick(tick),
        .led(led)
    );
endmodule
