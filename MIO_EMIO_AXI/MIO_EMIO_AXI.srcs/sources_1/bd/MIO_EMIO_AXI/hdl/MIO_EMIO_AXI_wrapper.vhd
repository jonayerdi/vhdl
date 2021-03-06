--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
--Date        : Thu Oct 26 15:22:59 2017
--Host        : equipo running 64-bit major release  (build 9200)
--Command     : generate_target MIO_EMIO_AXI_wrapper.bd
--Design      : MIO_EMIO_AXI_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MIO_EMIO_AXI_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    gpio_0_tri_io : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    gpio_axi_tri_io : inout STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end MIO_EMIO_AXI_wrapper;

architecture STRUCTURE of MIO_EMIO_AXI_wrapper is
  component MIO_EMIO_AXI is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    gpio_axi_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gpio_axi_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gpio_axi_tri_t : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPIO_0_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    GPIO_0_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPIO_0_tri_t : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component MIO_EMIO_AXI;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal gpio_0_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_0_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_0_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_0_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_0_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_0_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_0_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_0_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_axi_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_axi_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_axi_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_axi_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_axi_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_axi_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_axi_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_axi_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
begin
MIO_EMIO_AXI_i: component MIO_EMIO_AXI
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      GPIO_0_tri_i(1) => gpio_0_tri_i_1(1),
      GPIO_0_tri_i(0) => gpio_0_tri_i_0(0),
      GPIO_0_tri_o(1) => gpio_0_tri_o_1(1),
      GPIO_0_tri_o(0) => gpio_0_tri_o_0(0),
      GPIO_0_tri_t(1) => gpio_0_tri_t_1(1),
      GPIO_0_tri_t(0) => gpio_0_tri_t_0(0),
      gpio_axi_tri_i(1) => gpio_axi_tri_i_1(1),
      gpio_axi_tri_i(0) => gpio_axi_tri_i_0(0),
      gpio_axi_tri_o(1) => gpio_axi_tri_o_1(1),
      gpio_axi_tri_o(0) => gpio_axi_tri_o_0(0),
      gpio_axi_tri_t(1) => gpio_axi_tri_t_1(1),
      gpio_axi_tri_t(0) => gpio_axi_tri_t_0(0)
    );
gpio_0_tri_iobuf_0: component IOBUF
     port map (
      I => gpio_0_tri_o_0(0),
      IO => gpio_0_tri_io(0),
      O => gpio_0_tri_i_0(0),
      T => gpio_0_tri_t_0(0)
    );
gpio_0_tri_iobuf_1: component IOBUF
     port map (
      I => gpio_0_tri_o_1(1),
      IO => gpio_0_tri_io(1),
      O => gpio_0_tri_i_1(1),
      T => gpio_0_tri_t_1(1)
    );
gpio_axi_tri_iobuf_0: component IOBUF
     port map (
      I => gpio_axi_tri_o_0(0),
      IO => gpio_axi_tri_io(0),
      O => gpio_axi_tri_i_0(0),
      T => gpio_axi_tri_t_0(0)
    );
gpio_axi_tri_iobuf_1: component IOBUF
     port map (
      I => gpio_axi_tri_o_1(1),
      IO => gpio_axi_tri_io(1),
      O => gpio_axi_tri_i_1(1),
      T => gpio_axi_tri_t_1(1)
    );
end STRUCTURE;
