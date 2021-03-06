LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
ENTITY module1 IS
PORT (

SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
KEY : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
PS2_CLK        : inout std_logic;                     
PS2_DAT        : inout std_logic;

CLOCK_50 : IN STD_LOGIC;
LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
DRAM_CLK, DRAM_CKE : OUT STD_LOGIC;
DRAM_ADDR : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
DRAM_BA_0, DRAM_BA_1 : BUFFER STD_LOGIC;
DRAM_CS_N, DRAM_CAS_N, DRAM_RAS_N, DRAM_WE_N : OUT STD_LOGIC;
DRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
DRAM_UDQM, DRAM_LDQM : BUFFER STD_LOGIC;

VGA_R:OUT std_logic_vector(9 downto 0);
VGA_G:OUT std_logic_vector(9 downto 0);
VGA_B:OUT std_logic_vector(9 downto 0);
VGA_CLK: OUT std_logic;
VGA_BLANK:OUT std_logic;
VGA_HS:OUT std_logic;
VGA_VS:OUT std_logic;
VGA_SYNC:OUT std_logic;

SRAM_DQ: INOUT STD_LOGIC_VECTOR(15 downto 0);
SRAM_ADDR:OUT STD_LOGIC_VECTOR(17 downto 0);
SRAM_LB_N:OUT STD_LOGIC;
SRAM_UB_N:OUT STD_LOGIC;
SRAM_CE_N:OUT STD_LOGIC;
SRAM_OE_N:OUT STD_LOGIC;
SRAM_WE_N:OUT STD_LOGIC;

SD_DAT,SD_DAT3, SD_CMD : INOUT STD_LOGIC;
SD_CLK : OUT STD_LOGIC;

I2C_SDAT : INOUT STD_LOGIC;
I2C_SCLK : OUT STD_LOGIC;
AUD_XCK  : OUT STD_LOGIC;
CLOCK_27 : IN STD_LOGIC;
AUD_ADCDAT, AUD_ADCLRCK, AUD_BCLK, AUD_DACLRCK : IN STD_LOGIC;
AUD_DACDAT : OUT STD_LOGIC
);

END module1;
ARCHITECTURE Structure OF module IS
	

 component nois_system is
        port (
            sdram_wire_addr      : out   std_logic_vector(11 downto 0);                    -- addr
            sdram_wire_ba        : out   std_logic_vector(1 downto 0);                     -- ba
            sdram_wire_cas_n     : out   std_logic;                                        -- cas_n
            sdram_wire_cke       : out   std_logic;                                        -- cke
            sdram_wire_cs_n      : out   std_logic;                                        -- cs_n
            sdram_wire_dq        : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
            sdram_wire_dqm       : out   std_logic_vector(1 downto 0);                     -- dqm
            sdram_wire_ras_n     : out   std_logic;                                        -- ras_n
            sdram_wire_we_n      : out   std_logic;                                        -- we_n
            sram_DQ              : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
            sram_ADDR            : out   std_logic_vector(17 downto 0);                    -- ADDR
            sram_LB_N            : out   std_logic;                                        -- LB_N
            sram_UB_N            : out   std_logic;                                        -- UB_N
            sram_CE_N            : out   std_logic;                                        -- CE_N
            sram_OE_N            : out   std_logic;                                        -- OE_N
            sram_WE_N            : out   std_logic;                                        -- WE_N
            clk_clk              : in    std_logic                     := 'X';             -- clk
            reset_reset_n        : in    std_logic                     := 'X';             -- reset_n
            vga_controller_CLK   : out   std_logic;                                        -- CLK
            vga_controller_HS    : out   std_logic;                                        -- HS
            vga_controller_VS    : out   std_logic;                                        -- VS
            vga_controller_BLANK : out   std_logic;                                        -- BLANK
            vga_controller_SYNC  : out   std_logic;                                        -- SYNC
            vga_controller_R     : out   std_logic_vector(9 downto 0);                     -- R
            vga_controller_G     : out   std_logic_vector(9 downto 0);                     -- G
            vga_controller_B     : out   std_logic_vector(9 downto 0);                     -- B
            sdram_clk_clk        : out   std_logic;                                        -- clk
				keys_export          : in    std_logic_vector(7 downto 0)  := (others => 'X');  -- export
				ps2_0_CLK        		: inout std_logic;                     
				ps2_0_DAT        		: inout std_logic; 
				
				altera_up_sd_card_avalon_interface_0_conduit_end_b_SD_cmd   : inout std_logic;             -- b_SD_cmd
				altera_up_sd_card_avalon_interface_0_conduit_end_b_SD_dat   : inout std_logic;             -- b_SD_dat
				altera_up_sd_card_avalon_interface_0_conduit_end_b_SD_dat3  : inout std_logic;             -- b_SD_dat3
				altera_up_sd_card_avalon_interface_0_conduit_end_o_SD_clock : out   std_logic;             -- o_SD_clock


				up_clocks_0_clk_in_secondary_clk                            : in    std_logic;             -- clk
				up_clocks_0_audio_clk_clk                                   : out   std_LOGIC;

				audio_and_video_config_0_external_interface_SDAT            : inout std_logic;             -- SDAT
				audio_and_video_config_0_external_interface_SCLK            : out   std_logic;             -- SCLK
				audio_0_external_interface_ADCDAT                           : in    std_logic;             -- ADCDAT
				audio_0_external_interface_ADCLRCK                          : in    std_logic;             -- ADCLRCK
				audio_0_external_interface_BCLK                             : in    std_logic;             -- BCLK
				audio_0_external_interface_DACDAT                           : out   std_logic;             -- DACDAT
				audio_0_external_interface_DACLRCK                          : in    std_logic              -- DACLRCK
        );
    end component nois_system;



SIGNAL DQM : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL BA : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
DRAM_BA_0 <= BA(0);
DRAM_BA_1 <= BA(1);
DRAM_UDQM <= DQM(1);
DRAM_LDQM <= DQM(0);



u0 : component nois_system
        port map (
            sdram_wire_addr      => DRAM_ADDR,    
            sdram_wire_ba        => BA,       
            sdram_wire_cas_n     => DRAM_CAS_N,    
            sdram_wire_cke       => DRAM_CKE,     
            sdram_wire_cs_n      => DRAM_CS_N,   
            sdram_wire_dq        => DRAM_DQ,      
            sdram_wire_dqm       => DQM,  
            sdram_wire_ras_n     => DRAM_RAS_N, 
            sdram_wire_we_n      => DRAM_WE_N,     
				
            sram_DQ              => SRAM_DQ,        
            sram_ADDR            => SRAM_ADDR,      
            sram_LB_N            => SRAM_LB_N,       
            sram_UB_N            => SRAM_UB_N,       
            sram_CE_N            => SRAM_CE_N,     
            sram_OE_N            => SRAM_OE_N,       
            sram_WE_N            => SRAM_WE_N,          
				
            clk_clk              => CLOCK_50,          
            reset_reset_n        => KEY(0),     
            vga_controller_CLK   => VGA_CLK,  
            vga_controller_HS    => VGA_HS,   
            vga_controller_VS    => VGA_VS,  
            vga_controller_BLANK => VGA_BLANK,
            vga_controller_SYNC  => VGA_SYNC,  
            vga_controller_R     => VGA_R,    
            vga_controller_G     => VGA_G,   
            vga_controller_B     => VGA_B,    
				ps2_0_CLK => PS2_CLK,                     
				ps2_0_DAT => PS2_DAT,
				keys_export(3 downto 1) => KEY(3 downto 1),
				
            sdram_clk_clk        => DRAM_CLK,

				altera_up_sd_card_avalon_interface_0_conduit_end_b_SD_cmd => SD_CMD,             -- b_SD_cmd
				altera_up_sd_card_avalon_interface_0_conduit_end_b_SD_dat => SD_DAT,             -- b_SD_dat
				altera_up_sd_card_avalon_interface_0_conduit_end_b_SD_dat3 => SD_DAT3,            -- b_SD_dat3
				altera_up_sd_card_avalon_interface_0_conduit_end_o_SD_clock => SD_CLK,           -- o_SD_clock

				up_clocks_0_clk_in_secondary_clk => ClOCK_27,             -- clk
				up_clocks_0_audio_clk_clk => AUD_XCK,

				audio_and_video_config_0_external_interface_SDAT => I2c_SDAT,
				audio_and_video_config_0_external_interface_SCLK => I2c_SCLK,
				audio_0_external_interface_ADCDAT  => AUD_ADCDAT,                   
				audio_0_external_interface_ADCLRCK => AUD_ADCLRCK,         
				audio_0_external_interface_BCLK    => AUD_BCLK,     
				audio_0_external_interface_DACDAT  => AUD_DACDAT,  
				audio_0_external_interface_DACLRCK => AUD_DACLRCK 				
        );



END Structure;
