`ifndef _INTEL_AVALON_PKG_
`define _INTEL_AVALON_PKG_
  package intel_avalon_pkg;

  //*******************************
  //  Avalon - Memory mapped interface
  //*******************************

  `ifndef AVALON_ADDR_WIDTH
    `define AVALON_ADDR_WIDTH        32
  `endif

  `ifndef AVALON_DATA_WIDTH
    `define AVALON_DATA_WIDTH        32
  `endif

  `ifndef AVALON_BURST_WIDTH
    `define AVALON_BURST_WIDTH       11 // Max burst 2KiB
  `endif

  typedef logic [`AVALON_ADDR_WIDTH-1:0]      avalon_addr_t;
  typedef logic [`AVALON_DATA_WIDTH-1:0]      avalon_data_t;
  typedef logic [(`AVALON_DATA_WIDTH/8)-1:0]  avalon_be_t;
  typedef logic [`AVALON_BURST_WIDTH-1:0]     avalon_burst_t;

  typedef enum logic [1:0] {
    AVALON_OKAY,
    AVALON_EXOKAY,
    AVALON_SLVERR,
    AVALON_DECERR
  } avalon_resp_t;

  typedef enum logic {
    AVALON_NO_LOCK,
    AVALON_LOCK
  } avalon_lock_t;

  typedef struct packed {
    // Globals
    logic           aclk;
    logic           arst;
  } s_avalon_glb_t;

  typedef struct packed {
    avalon_addr_t   address;
    avalon_be_t     byte_enable;
    logic           debug_access;
    logic           read;
    logic           write;
    avalon_data_t   write_data;
    avalon_lock_t   lock;
    logic           begin_burst_transfer;
    avalon_burst_t  burst_count;
  } s_avalon_mosi_t;

  typedef struct packed {
    avalon_data_t   read_data;
    avalon_resp_t   response;
    logic           wait_request;
    logic           read_data_valid;
    avalon_resp_t   write_response_valid;
  } s_avalon_miso_t;
 endpackage
`endif
