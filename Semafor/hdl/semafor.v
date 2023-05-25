module semafor (
input     clk              , // semnal de ceas, 
input     rst_n            , // semnal de reset asincron activ 0
input     buton            , // buton
output    semafor_masini   , // output1
output    semafor_pietoni    // output2
);

reg [1:0] stare_prezenta;
reg [1:0] stare_viitoare;
reg [8:0] counter       ;
reg buton_apasat        ;
reg ok1                 ;
reg ok2                 ;

initial begin
counter      <= 8'b0;
buton_apasat <= 1'b0;
ok1 <= 1'b0;
ok2 <= 1'b0;
end 

// coduri stari (unice)
localparam stare1    = 2'b00; // verde pietoni , rosu   masini
localparam stare2    = 2'b11; // rosu  pietoni , verde  masini
localparam stare3    = 2'b10; // rosu  pietoni , galben masini

always @(posedge clk)
counter <= counter + 1;
// modeleaza registrul de stare
always @(posedge clk or negedge rst_n)
if (~rst_n) begin
            stare_prezenta <= stare1;  // stare initiala
            counter        <= 8'b0  ;
end
else        stare_prezenta <= stare_viitoare;
// modeleaza circuitul combinational de stare
always @(*)
case (stare_prezenta)
stare1 :  begin
          ok1 <= 1'b1;
          ok2 <= 1'b0;
          buton_apasat <= 1'b0;
          if(counter == 'd30) begin
              counter        <= 'b0;
              stare_viitoare <= stare3;
          end
          end
stare2 :  begin
          ok2 <= 1'b1;
          ok1 <= 1'b0;
          if(buton && !buton_apasat) begin
              buton_apasat <= 1'b1;
              counter <= 8'b0;
          end
          else if (buton_apasat == 1'b1 && counter == 'd60) begin
                   counter        <= 8'b0;
                   stare_viitoare <= stare3;
          end
          end
stare3 :  begin
          buton_apasat <= 1'b0;
          if(counter == 'd5) begin
              counter        <= 'b0;
              if(ok1 == 1'b1)
              stare_viitoare <= stare2;
              else if(ok2 == 1'b1)
              stare_viitoare <= stare1;
          end
          end
default   :  stare_viitoare <= stare1;  // s_final
endcase
            
// modeleaza circuitul combinational de iesire
assign semafor_masini    = (stare_prezenta == stare2  );
assign semafor_pietoni   = (stare_prezenta == stare1  );

endmodule // semafor
