class base_test extends uvm_test;
  my_env env_o;
  base_seq b_seq;
  `uvm_component_utils(base_test)
  
  function new  (string name,uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_o = my_env::type_id::create("env_o",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    b_seq = base_seq::type_id::create("b_seq");
    repeat(10) begin
      #5;
      b_seq.start(env_o.agt.seqr);
    end
    phase.drop_objection(this);
    `uvm_info(get_type_name,"end of test",UVM_LOW);
  endtask
endclass
