class my_scoreboard extends uvm_scoreboard;
  uvm_analysis_imp #(seq_item,my_scoreboard) item_collect_export;
  
  seq_item item_q[$];
  `uvm_component_utils(my_scoreboard)
  
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    item_collect_export = new("item_collect_export",this);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  function void write(seq_item req);
    item_q.push_back(req);
  endfunction
  
  task run_phase (uvm_phase phase);
    seq_item sb_item;
  forever begin
    wait(item_q.size>0);
    
    if(item_q.size>0) begin
      sb_item = item_q.pop_front();
      $display("----------------------------------");
      if(sb_item.a+sb_item.b  == sb_item.sum) begin
        `uvm_info(get_type_name,$sformatf("mateched a=%0d b=%0d  sum=%0d",sb_item.a,sb_item.b,sb_item.sum),UVM_LOW);
      end
      else begin
        `uvm_error(get_name,$sformatf("notmatched "));
      end
      $display("---------------------------------");
    end
  end
  endtask
endclass
  
