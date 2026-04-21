class base_seq extends uvm_sequence #(seq_item);
  `uvm_object_utils(base_seq)
  
  seq_item req;
  
  function new(string name= "sdsd");
    super.new(name);
  endfunction
  
  
  task body(); 
    `uvm_info(get_type_name(),"base sequence inside body",UVM_LOW);
    `uvm_do(req);
  endtask
endclass

  
