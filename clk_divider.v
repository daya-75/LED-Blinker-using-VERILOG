module clk_divider_2Hz (
    input wire clk,
    input wire rst,
    output reg tick
);
    parameter DIVISOR = 25_000_000;

    reg [24:0] count; // Enough bits for the count

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            tick <= 0;
        end else begin
            if (count == DIVISOR - 1) begin
                count <= 0;
                tick <= 1;
            end else begin
                count <= count + 1;
                tick <= 0;
            end
        end
    end
endmodule
