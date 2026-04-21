class seq_item extends uvm_sequence_item;
  `uvm_object_utils_begin(seq_item)
   `uvm_field_int(a,UVM_ALL_ON)
   `uvm_field_int(b,UVM_ALL_ON)
  `uvm_object_utils_end
  
  rand bit [7:0]a,b;
  bit [8:0]sum;
  
  function new(string name = "ddsafsd");
    super.new(name);
  endfunction
  
  constraint ip {a<100; b<100;}
endclass  
