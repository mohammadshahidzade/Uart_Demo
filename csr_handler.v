module csr_handler(
    input clk,
    input[31:0] state,
    input[31:0] value,
    output[31:0] out
);

integer file;

// initial begin
// end

reg flag = 1'b0;
reg [63:0] counter = 1'b0;
always @(posedge clk) begin
    if(state==32'd0)begin
        flag = 1'b1;
    end else if(state==32'd1 & flag==1'b1) begin
        file = $fopen("csr_handler_output.txt", "a");
        flag = 1'b0;
        $fwrite(file,"%d\n",value);
        $fclose(file);
    end else if(state==32'd2 & flag==1'b1) begin
        file = $fopen("csr_handler_output.txt", "a");
        flag = 1'b0;
        $fwrite(file,"%c",value);
        $fclose(file);
    end else if(state==32'd3 & flag==1'b1) begin
        file = $fopen("csr_handler_output.txt", "a");
        flag = 1'b0;
        $fwrite(file,"%h\n",value);
        $fclose(file);
    end else if(state==32'd4 & flag==1'b1) begin
        file = $fopen("csr_handler_output.txt", "a");
        flag = 1'b0;
        $fwrite(file,"%b\n",value);
        $fclose(file);
    end else if(state==32'd5 & flag==1'b1) begin
        file = $fopen("csr_handler_output.txt", "a");
        flag = 1'b0;
        $fwrite(file,"Counter : %d\n",counter);
        $fclose(file);
    end
end

always @(posedge clk) begin
    counter = counter+1;
end

endmodule