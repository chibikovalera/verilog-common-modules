`timescale 1ns / 1ps

module TEST_UART;

reg RXD;
reg CLK;
reg RST;


wire RX_DATA_en;
wire [9:0] RX_DATA_T;

CV_UART uart (
	.RXD(RXD), 
	.CLK(CLK), 
	.RST(RST), 
		
	.RX_DATA_EN(RX_DATA_en),
	.RX_DATA_T(RX_DATA_T)
);
	
wire RXD_RG;
wire UART_CE;
wire RXCT_R;
wire RX_CE;

CV_SYNCH synch
(
	.RXD(RXD),
	.CLK(CLK),
	.RST(RST),
		
	.RXD_RG(RXD_RG)
);

CV_DIVIDER divider
(
	.CLK(CLK),
	.RST(RST),
	
	.UART_CE(UART_CE)
);

RX_FSM rx_fsm
(
	.RXD_RG(RXD_RG),
	.CLK(CLK),
	.RST(RST),
	.RX_CE(RX_CE),
	
	.RXCT_R(RXCT_R),
	.RX_DATA_EN(RX_DATA_EN),
	.RX_DATA_T(RX_DATA_T)
);

RX_SAMPLE_COUNTER rx_samp_ct
(
	.UART_CE(UART_CE),
	.CLK(CLK),
	.RST(RST),
	.RXCT_R(RXCT_R),
		
	.RX_CE(RX_CE)
);
  
wire TX_CE;
wire TXCT_R;

TX_FSM tx_fsm
(
    .RST(RST),
    .CLK(CLK),
    .UART_CE(UART_CE),
    .TX_CE(TX_CE),
    .TX_RDY_T(TX_RDY_T),
    .TX_DATA_R(TX_DATA_R),
      
    .TX_RDY_R(TX_RDY_R),
    .TXD(TXD)
);
    
TX_SAMPLE_COUNTER tx_samp_ct
(
    .RST(RST),
    .CLK(CLK),
    .UART_CE(UART_CE),
    .TXCT_R(TXCT_R),
     
    .TX_CE(TX_CE)
);
        
always #1 CLK = ~CLK;
initial 
begin
	RXD = 1;
	CLK = 0;
	RST = 0;
	#3 RST = 1;
	#1 RST = 0;
	#2035 RXD = 0;
	#7070 RXD = 1;
	#11000 RXD = 0;
	#11000 RXD = 1;
	#11000 RXD = 1;
	#11000 RXD = 0;
	#11000 RXD = 0;
	#11000 RXD = 1;
	#11000 RXD = 1;
	#11000 RXD = 1;
end
      
endmodule

