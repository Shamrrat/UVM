class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  my_agent agt;
  my_scoreboard sb;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = my_agent::type_id::create("my_agent",this);
    sb = my_scoreboard::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    agt.mon.item_collect_port.connect(sb.item_collect_export);
  endfunction
endclass
