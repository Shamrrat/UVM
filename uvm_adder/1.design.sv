module adder(add_if.DUT i);
  
  always@(posedge i.clk or posedge i.reset)
    begin
      if(i.reset)
        i.sum<=0;
      else
        i.sum<=i.a+i.b;
    end
endmodule																														
