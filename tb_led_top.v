module tb_led_top;
    reg clk = 0;
    reg rst = 1;
    reg btn = 0;
    wire led;

    // Generate clock
    always #1_000_000 clk = ~clk; 

    led_top uut (
        .clk(clk),
        .rst(rst),
        .btn(btn),
        .led(led)
    );

    initial begin
        // Initialize
        #2_000_000;
        rst = 0;

        // Simulate button press
        #2_000_000;
        btn = 1;
        #4_000_000;
        btn = 0;

        // Wait
        #10_000_000;

        // Press again to turn off
        btn = 1;
        #4_000_000;
        btn = 0;

        #1_000_000;

        $finish;
    end
endmodule
