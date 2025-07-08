module debouncer (
    input wire clk,
    input wire rst,
    input wire noisy_in,
    output reg clean_out
);
    parameter STABLE_COUNT = 3; //ADJUST ACCORDING TO THE PREFERED CLOCK

    reg [16:0] count;
    reg sync_0, sync_1;

    always @(posedge clk) begin
        sync_0 <= noisy_in;
        sync_1 <= sync_0;
    end

    // Debounce logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            clean_out <= 0;
        end else begin
            if (sync_1 == clean_out) begin
                count <= 0;
            end else begin
                count <= count + 1;
                if (count >= STABLE_COUNT) begin
                    clean_out <= sync_1;
                    count <= 0;
                end
            end
        end
    end
endmodule
