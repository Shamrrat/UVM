class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)
  
  my_driver drv;
  my_sequencer seqr;
  my_monitor  mon;
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(get_is_active == UVM_ACTIVE) begin
      drv = my_driver::type_id::create("drv",this);
      seqr = my_sequencer::type_id::create("seqr",this);
    end
    mon = my_monitor::type_id::create("mon",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    if(get_is_active == UVM_ACTIVE) begin
      drv.seq_item_port.connect(seqr.seq_item_export);
    end
  endfunction
endclass
