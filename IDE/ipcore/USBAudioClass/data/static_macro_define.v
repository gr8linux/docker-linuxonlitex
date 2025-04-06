`define getname(oriName,tmodule_name) \~oriName.tmodule_name


//===================================================================================================================================
//17) DEFINE
//===================================================================================================================================

`ifdef ENABLE_MIC1
    `define EP1_IN_EN 
`endif

`ifdef ENABLE_MIC2
    `define EP2_IN_EN 
`endif

`ifdef ENABLE_MIC3
    `define EP3_IN_EN 
`endif

`ifdef ENABLE_SPEAKER1
    `define EP4_OUT_EN 
`endif
`ifdef ENABLE_SPEAKER2
    `define EP5_OUT_EN 
`endif
`ifdef ENABLE_SPEAKER3
    `define EP6_OUT_EN 
`endif

`ifdef ENABLE_MIC3
    `define MIC3 
`else
    `ifdef ENABLE_MIC2
        `define MIC2
    `else
        `ifdef ENABLE_MIC1
            `define MIC1
        `else
            `define MIC0 
        `endif
    `endif
`endif

`ifdef ENABLE_SPEAKER3
    `define SPEAKER3 
`else
    `ifdef ENABLE_SPEAKER2
        `define SPEAKER2
    `else
        `ifdef ENABLE_SPEAKER1
            `define SPEAKER1
        `else
            `define SPEAKER0 
        `endif
    `endif
`endif

`ifdef     MIC0
    `ifdef     SPEAKER0
    `define HS_AUDIO_FEATURE_UNIT_ID1  31   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  31   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31   

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER1
    `define HS_AUDIO_FEATURE_UNIT_ID1  31   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  2   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31    

    `define HS_AUDIO_CLOCK_SOURCE_ID1  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff 
    `endif
 
    `ifdef     SPEAKER2
    `define HS_AUDIO_FEATURE_UNIT_ID1  31   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  2   
    `define HS_AUDIO_FEATURE_UNIT_ID5  6   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h05   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER3
    `define HS_AUDIO_FEATURE_UNIT_ID1  31   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  2   
    `define HS_AUDIO_FEATURE_UNIT_ID5  6   
    `define HS_AUDIO_FEATURE_UNIT_ID6  10   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  12  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h05   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'h08   
    `endif

 `endif

`ifdef     MIC1
    `ifdef     SPEAKER0
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  31   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER1
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  6   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif
 
    `ifdef     SPEAKER2
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  6   
    `define HS_AUDIO_FEATURE_UNIT_ID5  10   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h09   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER3
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  31   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  6   
    `define HS_AUDIO_FEATURE_UNIT_ID5  10   
    `define HS_AUDIO_FEATURE_UNIT_ID6  14   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  16  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h09   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'h0c   
    `endif

 `endif


`ifdef     MIC2
    `ifdef     SPEAKER0
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  31   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER1
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  10   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h0a   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif
 
    `ifdef     SPEAKER2
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  10   
    `define HS_AUDIO_FEATURE_UNIT_ID5  14   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  16   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h0a   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h0d   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER3
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  31   
    `define HS_AUDIO_FEATURE_UNIT_ID4  10   
    `define HS_AUDIO_FEATURE_UNIT_ID5  14   
    `define HS_AUDIO_FEATURE_UNIT_ID6  18   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  16   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  20  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h0a   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h0d   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'h10   
    `endif

 `endif


`ifdef     MIC3
    `ifdef     SPEAKER0
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  10   
    `define HS_AUDIO_FEATURE_UNIT_ID4  31   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'h0A   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER1
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  10   
    `define HS_AUDIO_FEATURE_UNIT_ID4  14   
    `define HS_AUDIO_FEATURE_UNIT_ID5  31   
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  16   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  31   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'h0A   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h0e   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'hff   
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif
 
    `ifdef     SPEAKER2
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  10   
    `define HS_AUDIO_FEATURE_UNIT_ID4  14   
    `define HS_AUDIO_FEATURE_UNIT_ID5  18    
    `define HS_AUDIO_FEATURE_UNIT_ID6  31   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  16   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  20   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  31  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'h0A   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h0e   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h11    
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'hff   
    `endif

    `ifdef     SPEAKER3
    `define HS_AUDIO_FEATURE_UNIT_ID1  2   
    `define HS_AUDIO_FEATURE_UNIT_ID2  6   
    `define HS_AUDIO_FEATURE_UNIT_ID3  10   
    `define HS_AUDIO_FEATURE_UNIT_ID4  14   
    `define HS_AUDIO_FEATURE_UNIT_ID5  18    
    `define HS_AUDIO_FEATURE_UNIT_ID6  22   

    `define HS_AUDIO_CLOCK_SOURCE_ID1  4   
    `define HS_AUDIO_CLOCK_SOURCE_ID2  8   
    `define HS_AUDIO_CLOCK_SOURCE_ID3  12   
    `define HS_AUDIO_CLOCK_SOURCE_ID4  16   
    `define HS_AUDIO_CLOCK_SOURCE_ID5  20   
    `define HS_AUDIO_CLOCK_SOURCE_ID6  24  

    `define FS_AUDIO_FEATURE_UNIT_ID1  8'h02   
    `define FS_AUDIO_FEATURE_UNIT_ID2  8'h06   
    `define FS_AUDIO_FEATURE_UNIT_ID3  8'h0A   
    `define FS_AUDIO_FEATURE_UNIT_ID4  8'h0e   
    `define FS_AUDIO_FEATURE_UNIT_ID5  8'h11    
    `define FS_AUDIO_FEATURE_UNIT_ID6  8'h14   
    `endif

 `endif


//



`define SAMPLE_NUM              SAMPLE_768000_NUM

`ifdef SAMPLE_32000
    `define SAMPLE_32000_NUM    1
`else
    `define SAMPLE_32000_NUM    0
`endif

`ifdef SAMPLE_44100
    `define SAMPLE_44100_NUM    SAMPLE_32000_NUM + 1
`else
    `define SAMPLE_44100_NUM    SAMPLE_32000_NUM
`endif

`ifdef SAMPLE_48000
    `define SAMPLE_48000_NUM    SAMPLE_44100_NUM + 1
`else
    `define SAMPLE_48000_NUM    SAMPLE_44100_NUM
`endif

`ifdef SAMPLE_64000
    `define SAMPLE_64000_NUM    SAMPLE_48000_NUM + 1
`else
    `define SAMPLE_64000_NUM    SAMPLE_48000_NUM
`endif

`ifdef SAMPLE_88200
    `define SAMPLE_88200_NUM    SAMPLE_64000_NUM + 1
`else
    `define SAMPLE_88200_NUM    SAMPLE_64000_NUM
`endif

`ifdef SAMPLE_96000
    `define SAMPLE_96000_NUM    SAMPLE_88200_NUM + 1
`else
    `define SAMPLE_96000_NUM    SAMPLE_88200_NUM
`endif
//
`ifdef SAMPLE_128000
    `define SAMPLE_128000_NUM    SAMPLE_96000_NUM + 1
`else
    `define SAMPLE_128000_NUM    SAMPLE_96000_NUM
`endif

`ifdef SAMPLE_176400
    `define SAMPLE_176400_NUM    SAMPLE_128000_NUM + 1
`else
    `define SAMPLE_176400_NUM    SAMPLE_128000_NUM
`endif

`ifdef SAMPLE_192000
    `define SAMPLE_192000_NUM    SAMPLE_176400_NUM + 1
`else
    `define SAMPLE_192000_NUM    SAMPLE_176400_NUM
`endif

`ifdef SAMPLE_352800
    `define SAMPLE_352800_NUM    SAMPLE_192000_NUM + 1
`else
    `define SAMPLE_352800_NUM    SAMPLE_192000_NUM
`endif

`ifdef SAMPLE_384000
    `define SAMPLE_384000_NUM    SAMPLE_352800_NUM + 1
`else
    `define SAMPLE_384000_NUM    SAMPLE_352800_NUM
`endif

`ifdef SAMPLE_705600
    `define SAMPLE_705600_NUM    SAMPLE_384000_NUM + 1
`else
    `define SAMPLE_705600_NUM    SAMPLE_384000_NUM
`endif

`ifdef SAMPLE_768000
    `define SAMPLE_768000_NUM    SAMPLE_705600_NUM + 1
`else
    `define SAMPLE_768000_NUM    SAMPLE_705600_NUM
`endif


//=============================================================
//===================================================

`define MIC1_SAMPLE_NUM              MIC1_SAMPLE_768000_NUM

`ifdef MIC1_SAMPLE_32000
    `define MIC1_SAMPLE_32000_NUM    1
`else
    `define MIC1_SAMPLE_32000_NUM    0
`endif

`ifdef MIC1_SAMPLE_44100
    `define MIC1_SAMPLE_44100_NUM    MIC1_SAMPLE_32000_NUM + 1
`else
    `define MIC1_SAMPLE_44100_NUM    MIC1_SAMPLE_32000_NUM
`endif

`ifdef MIC1_SAMPLE_48000
    `define MIC1_SAMPLE_48000_NUM    MIC1_SAMPLE_44100_NUM + 1
`else
    `define MIC1_SAMPLE_48000_NUM    MIC1_SAMPLE_44100_NUM
`endif

`ifdef MIC1_SAMPLE_64000
    `define MIC1_SAMPLE_64000_NUM    MIC1_SAMPLE_48000_NUM + 1
`else
    `define MIC1_SAMPLE_64000_NUM    MIC1_SAMPLE_48000_NUM
`endif

`ifdef MIC1_SAMPLE_88200
    `define MIC1_SAMPLE_88200_NUM    MIC1_SAMPLE_64000_NUM + 1
`else
    `define MIC1_SAMPLE_88200_NUM    MIC1_SAMPLE_64000_NUM
`endif

`ifdef MIC1_SAMPLE_96000
    `define MIC1_SAMPLE_96000_NUM    MIC1_SAMPLE_88200_NUM + 1
`else
    `define MIC1_SAMPLE_96000_NUM    MIC1_SAMPLE_88200_NUM
`endif
//
`ifdef MIC1_SAMPLE_128000
    `define MIC1_SAMPLE_128000_NUM    MIC1_SAMPLE_96000_NUM + 1
`else
    `define MIC1_SAMPLE_128000_NUM    MIC1_SAMPLE_96000_NUM
`endif

`ifdef MIC1_SAMPLE_176400
    `define MIC1_SAMPLE_176400_NUM    MIC1_SAMPLE_128000_NUM + 1
`else
    `define MIC1_SAMPLE_176400_NUM    MIC1_SAMPLE_128000_NUM
`endif

`ifdef MIC1_SAMPLE_192000
    `define MIC1_SAMPLE_192000_NUM    MIC1_SAMPLE_176400_NUM + 1
`else
    `define MIC1_SAMPLE_192000_NUM    MIC1_SAMPLE_176400_NUM
`endif

`ifdef MIC1_SAMPLE_352800
    `define MIC1_SAMPLE_352800_NUM    MIC1_SAMPLE_192000_NUM + 1
`else
    `define MIC1_SAMPLE_352800_NUM    MIC1_SAMPLE_192000_NUM
`endif

`ifdef MIC1_SAMPLE_384000
    `define MIC1_SAMPLE_384000_NUM    MIC1_SAMPLE_352800_NUM + 1
`else
    `define MIC1_SAMPLE_384000_NUM    MIC1_SAMPLE_352800_NUM
`endif

`ifdef MIC1_SAMPLE_705600
    `define MIC1_SAMPLE_705600_NUM    MIC1_SAMPLE_384000_NUM + 1
`else
    `define MIC1_SAMPLE_705600_NUM    MIC1_SAMPLE_384000_NUM
`endif

`ifdef MIC1_SAMPLE_768000
    `define MIC1_SAMPLE_768000_NUM    MIC1_SAMPLE_705600_NUM + 1
`else
    `define MIC1_SAMPLE_768000_NUM    MIC1_SAMPLE_705600_NUM
`endif

//=============================================================
//===================================================

`define MIC2_SAMPLE_NUM              MIC2_SAMPLE_768000_NUM

`ifdef MIC2_SAMPLE_32000
    `define MIC2_SAMPLE_32000_NUM    1
`else
    `define MIC2_SAMPLE_32000_NUM    0
`endif

`ifdef MIC2_SAMPLE_44100
    `define MIC2_SAMPLE_44100_NUM    MIC2_SAMPLE_32000_NUM + 1
`else
    `define MIC2_SAMPLE_44100_NUM    MIC2_SAMPLE_32000_NUM
`endif

`ifdef MIC2_SAMPLE_48000
    `define MIC2_SAMPLE_48000_NUM    MIC2_SAMPLE_44100_NUM + 1
`else
    `define MIC2_SAMPLE_48000_NUM    MIC2_SAMPLE_44100_NUM
`endif

`ifdef MIC2_SAMPLE_64000
    `define MIC2_SAMPLE_64000_NUM    MIC2_SAMPLE_48000_NUM + 1
`else
    `define MIC2_SAMPLE_64000_NUM    MIC2_SAMPLE_48000_NUM
`endif

`ifdef MIC2_SAMPLE_88200
    `define MIC2_SAMPLE_88200_NUM    MIC2_SAMPLE_64000_NUM + 1
`else
    `define MIC2_SAMPLE_88200_NUM    MIC2_SAMPLE_64000_NUM
`endif

`ifdef MIC2_SAMPLE_96000
    `define MIC2_SAMPLE_96000_NUM    MIC2_SAMPLE_88200_NUM + 1
`else
    `define MIC2_SAMPLE_96000_NUM    MIC2_SAMPLE_88200_NUM
`endif
//
`ifdef MIC2_SAMPLE_128000
    `define MIC2_SAMPLE_128000_NUM    MIC2_SAMPLE_96000_NUM + 1
`else
    `define MIC2_SAMPLE_128000_NUM    MIC2_SAMPLE_96000_NUM
`endif

`ifdef MIC2_SAMPLE_176400
    `define MIC2_SAMPLE_176400_NUM    MIC2_SAMPLE_128000_NUM + 1
`else
    `define MIC2_SAMPLE_176400_NUM    MIC2_SAMPLE_128000_NUM
`endif

`ifdef MIC2_SAMPLE_192000
    `define MIC2_SAMPLE_192000_NUM    MIC2_SAMPLE_176400_NUM + 1
`else
    `define MIC2_SAMPLE_192000_NUM    MIC2_SAMPLE_176400_NUM
`endif

`ifdef MIC2_SAMPLE_352800
    `define MIC2_SAMPLE_352800_NUM    MIC2_SAMPLE_192000_NUM + 1
`else
    `define MIC2_SAMPLE_352800_NUM    MIC2_SAMPLE_192000_NUM
`endif

`ifdef MIC2_SAMPLE_384000
    `define MIC2_SAMPLE_384000_NUM    MIC2_SAMPLE_352800_NUM + 1
`else
    `define MIC2_SAMPLE_384000_NUM    MIC2_SAMPLE_352800_NUM
`endif

`ifdef MIC2_SAMPLE_705600
    `define MIC2_SAMPLE_705600_NUM    MIC2_SAMPLE_384000_NUM + 1
`else
    `define MIC2_SAMPLE_705600_NUM    MIC2_SAMPLE_384000_NUM
`endif

`ifdef MIC2_SAMPLE_768000
    `define MIC2_SAMPLE_768000_NUM    MIC2_SAMPLE_705600_NUM + 1
`else
    `define MIC2_SAMPLE_768000_NUM    MIC2_SAMPLE_705600_NUM
`endif

//=============================================================
//===================================================

`define MIC3_SAMPLE_NUM              MIC3_SAMPLE_768000_NUM

`ifdef MIC3_SAMPLE_32000
    `define MIC3_SAMPLE_32000_NUM    1
`else
    `define MIC3_SAMPLE_32000_NUM    0
`endif

`ifdef MIC3_SAMPLE_44100
    `define MIC3_SAMPLE_44100_NUM    MIC3_SAMPLE_32000_NUM + 1
`else
    `define MIC3_SAMPLE_44100_NUM    MIC3_SAMPLE_32000_NUM
`endif

`ifdef MIC3_SAMPLE_48000
    `define MIC3_SAMPLE_48000_NUM    MIC3_SAMPLE_44100_NUM + 1
`else
    `define MIC3_SAMPLE_48000_NUM    MIC3_SAMPLE_44100_NUM
`endif

`ifdef MIC3_SAMPLE_64000
    `define MIC3_SAMPLE_64000_NUM    MIC3_SAMPLE_48000_NUM + 1
`else
    `define MIC3_SAMPLE_64000_NUM    MIC3_SAMPLE_48000_NUM
`endif

`ifdef MIC3_SAMPLE_88200
    `define MIC3_SAMPLE_88200_NUM    MIC3_SAMPLE_64000_NUM + 1
`else
    `define MIC3_SAMPLE_88200_NUM    MIC3_SAMPLE_64000_NUM
`endif

`ifdef MIC3_SAMPLE_96000
    `define MIC3_SAMPLE_96000_NUM    MIC3_SAMPLE_88200_NUM + 1
`else
    `define MIC3_SAMPLE_96000_NUM    MIC3_SAMPLE_88200_NUM
`endif
//
`ifdef MIC3_SAMPLE_128000
    `define MIC3_SAMPLE_128000_NUM    MIC3_SAMPLE_96000_NUM + 1
`else
    `define MIC3_SAMPLE_128000_NUM    MIC3_SAMPLE_96000_NUM
`endif

`ifdef MIC3_SAMPLE_176400
    `define MIC3_SAMPLE_176400_NUM    MIC3_SAMPLE_128000_NUM + 1
`else
    `define MIC3_SAMPLE_176400_NUM    MIC3_SAMPLE_128000_NUM
`endif

`ifdef MIC3_SAMPLE_192000
    `define MIC3_SAMPLE_192000_NUM    MIC3_SAMPLE_176400_NUM + 1
`else
    `define MIC3_SAMPLE_192000_NUM    MIC3_SAMPLE_176400_NUM
`endif

`ifdef MIC3_SAMPLE_352800
    `define MIC3_SAMPLE_352800_NUM    MIC3_SAMPLE_192000_NUM + 1
`else
    `define MIC3_SAMPLE_352800_NUM    MIC3_SAMPLE_192000_NUM
`endif

`ifdef MIC3_SAMPLE_384000
    `define MIC3_SAMPLE_384000_NUM    MIC3_SAMPLE_352800_NUM + 1
`else
    `define MIC3_SAMPLE_384000_NUM    MIC3_SAMPLE_352800_NUM
`endif

`ifdef MIC3_SAMPLE_705600
    `define MIC3_SAMPLE_705600_NUM    MIC3_SAMPLE_384000_NUM + 1
`else
    `define MIC3_SAMPLE_705600_NUM    MIC3_SAMPLE_384000_NUM
`endif

`ifdef MIC3_SAMPLE_768000
    `define MIC3_SAMPLE_768000_NUM    MIC3_SAMPLE_705600_NUM + 1
`else
    `define MIC3_SAMPLE_768000_NUM    MIC3_SAMPLE_705600_NUM
`endif

//=============================================================
//===================================================

`define SPEAKER1_SAMPLE_NUM             SPEAKER1_SAMPLE_768000_NUM

`define SPEAKER1_FS16_SAMPLE_NUM        SPEAKER1_SAMPLE_192000_NUM
`define SPEAKER1_FS24_SAMPLE_NUM        SPEAKER1_SAMPLE_176400_NUM
`define SPEAKER1_FS32_SAMPLE_NUM        SPEAKER1_SAMPLE_176400_NUM



`ifdef SPEAKER1_SAMPLE_32000
    `define SPEAKER1_SAMPLE_32000_NUM    1
`else
    `define SPEAKER1_SAMPLE_32000_NUM    0
`endif

`ifdef SPEAKER1_SAMPLE_44100
    `define SPEAKER1_SAMPLE_44100_NUM    SPEAKER1_SAMPLE_32000_NUM + 1
`else
    `define SPEAKER1_SAMPLE_44100_NUM    SPEAKER1_SAMPLE_32000_NUM
`endif

`ifdef SPEAKER1_SAMPLE_48000
    `define SPEAKER1_SAMPLE_48000_NUM    SPEAKER1_SAMPLE_44100_NUM + 1
`else
    `define SPEAKER1_SAMPLE_48000_NUM    SPEAKER1_SAMPLE_44100_NUM
`endif

`ifdef SPEAKER1_SAMPLE_64000
    `define SPEAKER1_SAMPLE_64000_NUM    SPEAKER1_SAMPLE_48000_NUM + 1
`else
    `define SPEAKER1_SAMPLE_64000_NUM    SPEAKER1_SAMPLE_48000_NUM
`endif

`ifdef SPEAKER1_SAMPLE_88200
    `define SPEAKER1_SAMPLE_88200_NUM    SPEAKER1_SAMPLE_64000_NUM + 1
`else
    `define SPEAKER1_SAMPLE_88200_NUM    SPEAKER1_SAMPLE_64000_NUM
`endif

`ifdef SPEAKER1_SAMPLE_96000
    `define SPEAKER1_SAMPLE_96000_NUM    SPEAKER1_SAMPLE_88200_NUM + 1
`else
    `define SPEAKER1_SAMPLE_96000_NUM    SPEAKER1_SAMPLE_88200_NUM
`endif
//
`ifdef SPEAKER1_SAMPLE_128000
    `define SPEAKER1_SAMPLE_128000_NUM    SPEAKER1_SAMPLE_96000_NUM + 1
`else
    `define SPEAKER1_SAMPLE_128000_NUM    SPEAKER1_SAMPLE_96000_NUM
`endif

`ifdef SPEAKER1_SAMPLE_176400
    `define SPEAKER1_SAMPLE_176400_NUM    SPEAKER1_SAMPLE_128000_NUM + 1
`else
    `define SPEAKER1_SAMPLE_176400_NUM    SPEAKER1_SAMPLE_128000_NUM
`endif

`ifdef SPEAKER1_SAMPLE_192000
    `define SPEAKER1_SAMPLE_192000_NUM    SPEAKER1_SAMPLE_176400_NUM + 1
`else
    `define SPEAKER1_SAMPLE_192000_NUM    SPEAKER1_SAMPLE_176400_NUM
`endif

`ifdef SPEAKER1_SAMPLE_352800
    `define SPEAKER1_SAMPLE_352800_NUM    SPEAKER1_SAMPLE_192000_NUM + 1
`else
    `define SPEAKER1_SAMPLE_352800_NUM    SPEAKER1_SAMPLE_192000_NUM
`endif

`ifdef SPEAKER1_SAMPLE_384000
    `define SPEAKER1_SAMPLE_384000_NUM    SPEAKER1_SAMPLE_352800_NUM + 1
`else
    `define SPEAKER1_SAMPLE_384000_NUM    SPEAKER1_SAMPLE_352800_NUM
`endif

`ifdef SPEAKER1_SAMPLE_705600
    `define SPEAKER1_SAMPLE_705600_NUM    SPEAKER1_SAMPLE_384000_NUM + 1
`else
    `define SPEAKER1_SAMPLE_705600_NUM    SPEAKER1_SAMPLE_384000_NUM
`endif

`ifdef SPEAKER1_SAMPLE_768000
    `define SPEAKER1_SAMPLE_768000_NUM    SPEAKER1_SAMPLE_705600_NUM + 1
`else
    `define SPEAKER1_SAMPLE_768000_NUM    SPEAKER1_SAMPLE_705600_NUM
`endif

//=============================================================
//===================================================

`define SPEAKER2_SAMPLE_NUM              SPEAKER2_SAMPLE_768000_NUM
`define SPEAKER2_FS16_SAMPLE_NUM        SPEAKER2_SAMPLE_192000_NUM
`define SPEAKER2_FS24_SAMPLE_NUM        SPEAKER2_SAMPLE_176400_NUM
`define SPEAKER2_FS32_SAMPLE_NUM        SPEAKER2_SAMPLE_176400_NUM


`ifdef SPEAKER2_SAMPLE_32000
    `define SPEAKER2_SAMPLE_32000_NUM    1
`else
    `define SPEAKER2_SAMPLE_32000_NUM    0
`endif

`ifdef SPEAKER2_SAMPLE_44100
    `define SPEAKER2_SAMPLE_44100_NUM    SPEAKER2_SAMPLE_32000_NUM + 1
`else
    `define SPEAKER2_SAMPLE_44100_NUM    SPEAKER2_SAMPLE_32000_NUM
`endif

`ifdef SPEAKER2_SAMPLE_48000
    `define SPEAKER2_SAMPLE_48000_NUM    SPEAKER2_SAMPLE_44100_NUM + 1
`else
    `define SPEAKER2_SAMPLE_48000_NUM    SPEAKER2_SAMPLE_44100_NUM
`endif

`ifdef SPEAKER2_SAMPLE_64000
    `define SPEAKER2_SAMPLE_64000_NUM    SPEAKER2_SAMPLE_48000_NUM + 1
`else
    `define SPEAKER2_SAMPLE_64000_NUM    SPEAKER2_SAMPLE_48000_NUM
`endif

`ifdef SPEAKER2_SAMPLE_88200
    `define SPEAKER2_SAMPLE_88200_NUM    SPEAKER2_SAMPLE_64000_NUM + 1
`else
    `define SPEAKER2_SAMPLE_88200_NUM    SPEAKER2_SAMPLE_64000_NUM
`endif

`ifdef SPEAKER2_SAMPLE_96000
    `define SPEAKER2_SAMPLE_96000_NUM    SPEAKER2_SAMPLE_88200_NUM + 1
`else
    `define SPEAKER2_SAMPLE_96000_NUM    SPEAKER2_SAMPLE_88200_NUM
`endif
//
`ifdef SPEAKER2_SAMPLE_128000
    `define SPEAKER2_SAMPLE_128000_NUM    SPEAKER2_SAMPLE_96000_NUM + 1
`else
    `define SPEAKER2_SAMPLE_128000_NUM    SPEAKER2_SAMPLE_96000_NUM
`endif

`ifdef SPEAKER2_SAMPLE_176400
    `define SPEAKER2_SAMPLE_176400_NUM    SPEAKER2_SAMPLE_128000_NUM + 1
`else
    `define SPEAKER2_SAMPLE_176400_NUM    SPEAKER2_SAMPLE_128000_NUM
`endif

`ifdef SPEAKER2_SAMPLE_192000
    `define SPEAKER2_SAMPLE_192000_NUM    SPEAKER2_SAMPLE_176400_NUM + 1
`else
    `define SPEAKER2_SAMPLE_192000_NUM    SPEAKER2_SAMPLE_176400_NUM
`endif

`ifdef SPEAKER2_SAMPLE_352800
    `define SPEAKER2_SAMPLE_352800_NUM    SPEAKER2_SAMPLE_192000_NUM + 1
`else
    `define SPEAKER2_SAMPLE_352800_NUM    SPEAKER2_SAMPLE_192000_NUM
`endif

`ifdef SPEAKER2_SAMPLE_384000
    `define SPEAKER2_SAMPLE_384000_NUM    SPEAKER2_SAMPLE_352800_NUM + 1
`else
    `define SPEAKER2_SAMPLE_384000_NUM    SPEAKER2_SAMPLE_352800_NUM
`endif

`ifdef SPEAKER2_SAMPLE_705600
    `define SPEAKER2_SAMPLE_705600_NUM    SPEAKER2_SAMPLE_384000_NUM + 1
`else
    `define SPEAKER2_SAMPLE_705600_NUM    SPEAKER2_SAMPLE_384000_NUM
`endif

`ifdef SPEAKER2_SAMPLE_768000
    `define SPEAKER2_SAMPLE_768000_NUM    SPEAKER2_SAMPLE_705600_NUM + 1
`else
    `define SPEAKER2_SAMPLE_768000_NUM    SPEAKER2_SAMPLE_705600_NUM
`endif

//=============================================================
//===================================================

`define SPEAKER3_SAMPLE_NUM              SPEAKER3_SAMPLE_768000_NUM
`define SPEAKER3_FS16_SAMPLE_NUM        SPEAKER3_SAMPLE_192000_NUM
`define SPEAKER3_FS24_SAMPLE_NUM        SPEAKER3_SAMPLE_176400_NUM
`define SPEAKER3_FS32_SAMPLE_NUM        SPEAKER3_SAMPLE_176400_NUM

`ifdef SPEAKER3_SAMPLE_32000
    `define SPEAKER3_SAMPLE_32000_NUM    1
`else
    `define SPEAKER3_SAMPLE_32000_NUM    0
`endif

`ifdef SPEAKER3_SAMPLE_44100
    `define SPEAKER3_SAMPLE_44100_NUM    SPEAKER3_SAMPLE_32000_NUM + 1
`else
    `define SPEAKER3_SAMPLE_44100_NUM    SPEAKER3_SAMPLE_32000_NUM
`endif

`ifdef SPEAKER3_SAMPLE_48000
    `define SPEAKER3_SAMPLE_48000_NUM    SPEAKER3_SAMPLE_44100_NUM + 1
`else
    `define SPEAKER3_SAMPLE_48000_NUM    SPEAKER3_SAMPLE_44100_NUM
`endif

`ifdef SPEAKER3_SAMPLE_64000
    `define SPEAKER3_SAMPLE_64000_NUM    SPEAKER3_SAMPLE_48000_NUM + 1
`else
    `define SPEAKER3_SAMPLE_64000_NUM    SPEAKER3_SAMPLE_48000_NUM
`endif

`ifdef SPEAKER3_SAMPLE_88200
    `define SPEAKER3_SAMPLE_88200_NUM    SPEAKER3_SAMPLE_64000_NUM + 1
`else
    `define SPEAKER3_SAMPLE_88200_NUM    SPEAKER3_SAMPLE_64000_NUM
`endif

`ifdef SPEAKER3_SAMPLE_96000
    `define SPEAKER3_SAMPLE_96000_NUM    SPEAKER3_SAMPLE_88200_NUM + 1
`else
    `define SPEAKER3_SAMPLE_96000_NUM    SPEAKER3_SAMPLE_88200_NUM
`endif
//
`ifdef SPEAKER3_SAMPLE_128000
    `define SPEAKER3_SAMPLE_128000_NUM    SPEAKER3_SAMPLE_96000_NUM + 1
`else
    `define SPEAKER3_SAMPLE_128000_NUM    SPEAKER3_SAMPLE_96000_NUM
`endif

`ifdef SPEAKER3_SAMPLE_176400
    `define SPEAKER3_SAMPLE_176400_NUM    SPEAKER3_SAMPLE_128000_NUM + 1
`else
    `define SPEAKER3_SAMPLE_176400_NUM    SPEAKER3_SAMPLE_128000_NUM
`endif

`ifdef SPEAKER3_SAMPLE_192000
    `define SPEAKER3_SAMPLE_192000_NUM    SPEAKER3_SAMPLE_176400_NUM + 1
`else
    `define SPEAKER3_SAMPLE_192000_NUM    SPEAKER3_SAMPLE_176400_NUM
`endif

`ifdef SPEAKER3_SAMPLE_352800
    `define SPEAKER3_SAMPLE_352800_NUM    SPEAKER3_SAMPLE_192000_NUM + 1
`else
    `define SPEAKER3_SAMPLE_352800_NUM    SPEAKER3_SAMPLE_192000_NUM
`endif

`ifdef SPEAKER3_SAMPLE_384000
    `define SPEAKER3_SAMPLE_384000_NUM    SPEAKER3_SAMPLE_352800_NUM + 1
`else
    `define SPEAKER3_SAMPLE_384000_NUM    SPEAKER3_SAMPLE_352800_NUM
`endif

`ifdef SPEAKER3_SAMPLE_705600
    `define SPEAKER3_SAMPLE_705600_NUM    SPEAKER3_SAMPLE_384000_NUM + 1
`else
    `define SPEAKER3_SAMPLE_705600_NUM    SPEAKER3_SAMPLE_384000_NUM
`endif

`ifdef SPEAKER3_SAMPLE_768000
    `define SPEAKER3_SAMPLE_768000_NUM    SPEAKER3_SAMPLE_705600_NUM + 1
`else
    `define SPEAKER3_SAMPLE_768000_NUM    SPEAKER3_SAMPLE_705600_NUM
`endif

//=============================================================
//=============================================================
`ifdef MIC1_SAMPLE_32000
   `define MIC1_SAMPLE_32000_LEAST
`else
`ifdef MIC1_SAMPLE_44100
   `define MIC1_SAMPLE_44100_LEAST
`else
`ifdef MIC1_SAMPLE_48000
   `define MIC1_SAMPLE_48000_LEAST
`else
`ifdef MIC1_SAMPLE_64000
   `define MIC1_SAMPLE_64000_LEAST
`else
`ifdef MIC1_SAMPLE_88200
   `define MIC1_SAMPLE_88200_LEAST
`else
`ifdef MIC1_SAMPLE_96000
   `define MIC1_SAMPLE_96000_LEAST
`else
`ifdef MIC1_SAMPLE_128000
   `define MIC1_SAMPLE_128000_LEAST
`else
`ifdef MIC1_SAMPLE_176400
   `define MIC1_SAMPLE_176400_LEAST
`else
`ifdef MIC1_SAMPLE_192000
   `define MIC1_SAMPLE_192000_LEAST
`else
`ifdef MIC1_SAMPLE_352800
   `define MIC1_SAMPLE_352800_LEAST
`else
`ifdef MIC1_SAMPLE_384000
   `define MIC1_SAMPLE_384000_LEAST
`else
`ifdef MIC1_SAMPLE_705600
   `define MIC1_SAMPLE_705600_LEAST
`else
`ifdef MIC1_SAMPLE_768000
   `define MIC1_SAMPLE_768000_LEAST
`else
   `define MIC1_NO_SAMPLE
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
//========================================================================
//=============================================================
`ifdef MIC2_SAMPLE_32000
   `define MIC2_SAMPLE_32000_LEAST
`else
`ifdef MIC2_SAMPLE_44100
   `define MIC2_SAMPLE_44100_LEAST
`else
`ifdef MIC2_SAMPLE_48000
   `define MIC2_SAMPLE_48000_LEAST
`else
`ifdef MIC2_SAMPLE_64000
   `define MIC2_SAMPLE_64000_LEAST
`else
`ifdef MIC2_SAMPLE_88200
   `define MIC2_SAMPLE_88200_LEAST
`else
`ifdef MIC2_SAMPLE_96000
   `define MIC2_SAMPLE_96000_LEAST
`else
`ifdef MIC2_SAMPLE_128000
   `define MIC2_SAMPLE_128000_LEAST
`else
`ifdef MIC2_SAMPLE_176400
   `define MIC2_SAMPLE_176400_LEAST
`else
`ifdef MIC2_SAMPLE_192000
   `define MIC2_SAMPLE_192000_LEAST
`else
`ifdef MIC2_SAMPLE_352800
   `define MIC2_SAMPLE_352800_LEAST
`else
`ifdef MIC2_SAMPLE_384000
   `define MIC2_SAMPLE_384000_LEAST
`else
`ifdef MIC2_SAMPLE_705600
   `define MIC2_SAMPLE_705600_LEAST
`else
`ifdef MIC2_SAMPLE_768000
   `define MIC2_SAMPLE_768000_LEAST
`else
   `define MIC2_NO_SAMPLE
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
//========================================================================
//=============================================================
`ifdef MIC3_SAMPLE_32000
   `define MIC3_SAMPLE_32000_LEAST
`else
`ifdef MIC3_SAMPLE_44100
   `define MIC3_SAMPLE_44100_LEAST
`else
`ifdef MIC3_SAMPLE_48000
   `define MIC3_SAMPLE_48000_LEAST
`else
`ifdef MIC3_SAMPLE_64000
   `define MIC3_SAMPLE_64000_LEAST
`else
`ifdef MIC3_SAMPLE_88200
   `define MIC3_SAMPLE_88200_LEAST
`else
`ifdef MIC3_SAMPLE_96000
   `define MIC3_SAMPLE_96000_LEAST
`else
`ifdef MIC3_SAMPLE_128000
   `define MIC3_SAMPLE_128000_LEAST
`else
`ifdef MIC3_SAMPLE_176400
   `define MIC3_SAMPLE_176400_LEAST
`else
`ifdef MIC3_SAMPLE_192000
   `define MIC3_SAMPLE_192000_LEAST
`else
`ifdef MIC3_SAMPLE_352800
   `define MIC3_SAMPLE_352800_LEAST
`else
`ifdef MIC3_SAMPLE_384000
   `define MIC3_SAMPLE_384000_LEAST
`else
`ifdef MIC3_SAMPLE_705600
   `define MIC3_SAMPLE_705600_LEAST
`else
`ifdef MIC3_SAMPLE_768000
   `define MIC3_SAMPLE_768000_LEAST
`else
   `define MIC3_NO_SAMPLE
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
//========================================================================
//=============================================================
`ifdef SPEAKER1_SAMPLE_32000
   `define SPEAKER1_SAMPLE_32000_LEAST
`else
`ifdef SPEAKER1_SAMPLE_44100
   `define SPEAKER1_SAMPLE_44100_LEAST
`else
`ifdef SPEAKER1_SAMPLE_48000
   `define SPEAKER1_SAMPLE_48000_LEAST
`else
`ifdef SPEAKER1_SAMPLE_64000
   `define SPEAKER1_SAMPLE_64000_LEAST
`else
`ifdef SPEAKER1_SAMPLE_88200
   `define SPEAKER1_SAMPLE_88200_LEAST
`else
`ifdef SPEAKER1_SAMPLE_96000
   `define SPEAKER1_SAMPLE_96000_LEAST
`else
`ifdef SPEAKER1_SAMPLE_128000
   `define SPEAKER1_SAMPLE_128000_LEAST
`else
`ifdef SPEAKER1_SAMPLE_176400
   `define SPEAKER1_SAMPLE_176400_LEAST
`else
`ifdef SPEAKER1_SAMPLE_192000
   `define SPEAKER1_SAMPLE_192000_LEAST
`else
`ifdef SPEAKER1_SAMPLE_352800
   `define SPEAKER1_SAMPLE_352800_LEAST
`else
`ifdef SPEAKER1_SAMPLE_384000
   `define SPEAKER1_SAMPLE_384000_LEAST
`else
`ifdef SPEAKER1_SAMPLE_705600
   `define SPEAKER1_SAMPLE_705600_LEAST
`else
`ifdef SPEAKER1_SAMPLE_768000
   `define SPEAKER1_SAMPLE_768000_LEAST
`else
   `define SPEAKER1_NO_SAMPLE
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
//========================================================================
//=============================================================
`ifdef SPEAKER2_SAMPLE_32000
   `define SPEAKER2_SAMPLE_32000_LEAST
`else
`ifdef SPEAKER2_SAMPLE_44100
   `define SPEAKER2_SAMPLE_44100_LEAST
`else
`ifdef SPEAKER2_SAMPLE_48000
   `define SPEAKER2_SAMPLE_48000_LEAST
`else
`ifdef SPEAKER2_SAMPLE_64000
   `define SPEAKER2_SAMPLE_64000_LEAST
`else
`ifdef SPEAKER2_SAMPLE_88200
   `define SPEAKER2_SAMPLE_88200_LEAST
`else
`ifdef SPEAKER2_SAMPLE_96000
   `define SPEAKER2_SAMPLE_96000_LEAST
`else
`ifdef SPEAKER2_SAMPLE_128000
   `define SPEAKER2_SAMPLE_128000_LEAST
`else
`ifdef SPEAKER2_SAMPLE_176400
   `define SPEAKER2_SAMPLE_176400_LEAST
`else
`ifdef SPEAKER2_SAMPLE_192000
   `define SPEAKER2_SAMPLE_192000_LEAST
`else
`ifdef SPEAKER2_SAMPLE_352800
   `define SPEAKER2_SAMPLE_352800_LEAST
`else
`ifdef SPEAKER2_SAMPLE_384000
   `define SPEAKER2_SAMPLE_384000_LEAST
`else
`ifdef SPEAKER2_SAMPLE_705600
   `define SPEAKER2_SAMPLE_705600_LEAST
`else
`ifdef SPEAKER2_SAMPLE_768000
   `define SPEAKER2_SAMPLE_768000_LEAST
`else
   `define SPEAKER2_NO_SAMPLE
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
//========================================================================
//=============================================================
`ifdef SPEAKER3_SAMPLE_32000
   `define SPEAKER3_SAMPLE_32000_LEAST
`else
`ifdef SPEAKER3_SAMPLE_44100
   `define SPEAKER3_SAMPLE_44100_LEAST
`else
`ifdef SPEAKER3_SAMPLE_48000
   `define SPEAKER3_SAMPLE_48000_LEAST
`else
`ifdef SPEAKER3_SAMPLE_64000
   `define SPEAKER3_SAMPLE_64000_LEAST
`else
`ifdef SPEAKER3_SAMPLE_88200
   `define SPEAKER3_SAMPLE_88200_LEAST
`else
`ifdef SPEAKER3_SAMPLE_96000
   `define SPEAKER3_SAMPLE_96000_LEAST
`else
`ifdef SPEAKER3_SAMPLE_128000
   `define SPEAKER3_SAMPLE_128000_LEAST
`else
`ifdef SPEAKER3_SAMPLE_176400
   `define SPEAKER3_SAMPLE_176400_LEAST
`else
`ifdef SPEAKER3_SAMPLE_192000
   `define SPEAKER3_SAMPLE_192000_LEAST
`else
`ifdef SPEAKER3_SAMPLE_352800
   `define SPEAKER3_SAMPLE_352800_LEAST
`else
`ifdef SPEAKER3_SAMPLE_384000
   `define SPEAKER3_SAMPLE_384000_LEAST
`else
`ifdef SPEAKER3_SAMPLE_705600
   `define SPEAKER3_SAMPLE_705600_LEAST
`else
`ifdef SPEAKER3_SAMPLE_768000
   `define SPEAKER3_SAMPLE_768000_LEAST
`else
   `define SPEAKER3_NO_SAMPLE
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif
`endif


//


`ifdef MIC1_DATA_BITS32
    `ifdef MIC1_DATA_BITS24
        `ifdef MIC1_DATA_BITS16
            `define   MIC1_SETTING_NUM_16      8'd1
            `define   MIC1_SETTING_NUM_24      8'd2
            `define   MIC1_SETTING_NUM_32      8'd3
            `define   MIC1_SETTING_AMOUNT      8'd3
        `else
            `define   MIC1_SETTING_NUM_16      8'd15
            `define   MIC1_SETTING_NUM_24      8'd1
            `define   MIC1_SETTING_NUM_32      8'd2
            `define   MIC1_SETTING_AMOUNT      8'd2
        `endif
    `else
        `ifdef MIC1_DATA_BITS16
            `define   MIC1_SETTING_NUM_16      8'd1
            `define   MIC1_SETTING_NUM_24      8'd15
            `define   MIC1_SETTING_NUM_32      8'd2
            `define   MIC1_SETTING_AMOUNT      8'd2
        `else
            `define   MIC1_SETTING_NUM_16      8'd15
            `define   MIC1_SETTING_NUM_24      8'd15
            `define   MIC1_SETTING_NUM_32      8'd1
            `define   MIC1_SETTING_AMOUNT      8'd1
        `endif
    `endif
`else
    `ifdef MIC1_DATA_BITS24
        `ifdef MIC1_DATA_BITS16
            `define   MIC1_SETTING_NUM_16      8'd1
            `define   MIC1_SETTING_NUM_24      8'd2
            `define   MIC1_SETTING_NUM_32      8'd15
            `define   MIC1_SETTING_AMOUNT      8'd2
        `else
            `define   MIC1_SETTING_NUM_16      8'd15
            `define   MIC1_SETTING_NUM_24      8'd1
            `define   MIC1_SETTING_NUM_32      8'd15
            `define   MIC1_SETTING_AMOUNT      8'd1
        `endif
    `else
        `ifdef MIC1_DATA_BITS16
            `define   MIC1_SETTING_NUM_16      8'd1
            `define   MIC1_SETTING_NUM_24      8'd15
            `define   MIC1_SETTING_NUM_32      8'd15
            `define   MIC1_SETTING_AMOUNT      8'd1
        `else
            `define   MIC1_SETTING_NUM_16      8'd15
            `define   MIC1_SETTING_NUM_24      8'd15
            `define   MIC1_SETTING_NUM_32      8'd15
            `define   MIC1_SETTING_AMOUNT      8'd15
        `endif
    `endif
`endif

`ifdef MIC2_DATA_BITS32
    `ifdef MIC2_DATA_BITS24
        `ifdef MIC2_DATA_BITS16
            `define   MIC2_SETTING_NUM_16      8'd1
            `define   MIC2_SETTING_NUM_24      8'd2
            `define   MIC2_SETTING_NUM_32      8'd3
            `define   MIC2_SETTING_AMOUNT      8'd3
        `else
            `define   MIC2_SETTING_NUM_16      8'd15
            `define   MIC2_SETTING_NUM_24      8'd1
            `define   MIC2_SETTING_NUM_32      8'd2
            `define   MIC2_SETTING_AMOUNT      8'd2
        `endif
    `else
        `ifdef MIC2_DATA_BITS16
            `define   MIC2_SETTING_NUM_16      8'd1
            `define   MIC2_SETTING_NUM_24      8'd15
            `define   MIC2_SETTING_NUM_32      8'd2
            `define   MIC2_SETTING_AMOUNT      8'd2
        `else
            `define   MIC2_SETTING_NUM_16      8'd15
            `define   MIC2_SETTING_NUM_24      8'd15
            `define   MIC2_SETTING_NUM_32      8'd1
            `define   MIC2_SETTING_AMOUNT      8'd1
        `endif
    `endif
`else
    `ifdef MIC2_DATA_BITS24
        `ifdef MIC2_DATA_BITS16
            `define   MIC2_SETTING_NUM_16      8'd1
            `define   MIC2_SETTING_NUM_24      8'd2
            `define   MIC2_SETTING_NUM_32      8'd15
            `define   MIC2_SETTING_AMOUNT      8'd2
        `else
            `define   MIC2_SETTING_NUM_16      8'd15
            `define   MIC2_SETTING_NUM_24      8'd1
            `define   MIC2_SETTING_NUM_32      8'd15
            `define   MIC2_SETTING_AMOUNT      8'd1
        `endif
    `else
        `ifdef MIC2_DATA_BITS16
            `define   MIC2_SETTING_NUM_16      8'd1
            `define   MIC2_SETTING_NUM_24      8'd15
            `define   MIC2_SETTING_NUM_32      8'd15
            `define   MIC2_SETTING_AMOUNT      8'd1
        `else
            `define   MIC2_SETTING_NUM_16      8'd15
            `define   MIC2_SETTING_NUM_24      8'd15
            `define   MIC2_SETTING_NUM_32      8'd15
            `define   MIC2_SETTING_AMOUNT      8'd15
        `endif
    `endif
`endif

`ifdef MIC3_DATA_BITS32
    `ifdef MIC3_DATA_BITS24
        `ifdef MIC3_DATA_BITS16
            `define   MIC3_SETTING_NUM_16      8'd1
            `define   MIC3_SETTING_NUM_24      8'd2
            `define   MIC3_SETTING_NUM_32      8'd3
            `define   MIC3_SETTING_AMOUNT      8'd3
        `else
            `define   MIC3_SETTING_NUM_16      8'd15
            `define   MIC3_SETTING_NUM_24      8'd1
            `define   MIC3_SETTING_NUM_32      8'd2
            `define   MIC3_SETTING_AMOUNT      8'd2
        `endif
    `else
        `ifdef MIC3_DATA_BITS16
            `define   MIC3_SETTING_NUM_16      8'd1
            `define   MIC3_SETTING_NUM_24      8'd15
            `define   MIC3_SETTING_NUM_32      8'd2
            `define   MIC3_SETTING_AMOUNT      8'd2
        `else
            `define   MIC3_SETTING_NUM_16      8'd15
            `define   MIC3_SETTING_NUM_24      8'd15
            `define   MIC3_SETTING_NUM_32      8'd1
            `define   MIC3_SETTING_AMOUNT      8'd1
        `endif
    `endif
`else
    `ifdef MIC3_DATA_BITS24
        `ifdef MIC3_DATA_BITS16
            `define   MIC3_SETTING_NUM_16      8'd1
            `define   MIC3_SETTING_NUM_24      8'd2
            `define   MIC3_SETTING_NUM_32      8'd15
            `define   MIC3_SETTING_AMOUNT      8'd2
        `else
            `define   MIC3_SETTING_NUM_16      8'd15
            `define   MIC3_SETTING_NUM_24      8'd1
            `define   MIC3_SETTING_NUM_32      8'd15
            `define   MIC3_SETTING_AMOUNT      8'd1
        `endif
    `else
        `ifdef MIC3_DATA_BITS16
            `define   MIC3_SETTING_NUM_16      8'd1
            `define   MIC3_SETTING_NUM_24      8'd15
            `define   MIC3_SETTING_NUM_32      8'd15
            `define   MIC3_SETTING_AMOUNT      8'd1
        `else
            `define   MIC3_SETTING_NUM_16      8'd15
            `define   MIC3_SETTING_NUM_24      8'd15
            `define   MIC3_SETTING_NUM_32      8'd15
            `define   MIC3_SETTING_AMOUNT      8'd15
        `endif
    `endif
`endif

`ifdef SPEAKER1_DATA_BITS32
    `ifdef SPEAKER1_DATA_BITS24
        `ifdef SPEAKER1_DATA_BITS16
            `define   SPEAKER1_SETTING_NUM_16      8'd1
            `define   SPEAKER1_SETTING_NUM_24      8'd2
            `define   SPEAKER1_SETTING_NUM_32      8'd3
            `define   SPEAKER1_SETTING_AMOUNT      8'd3
        `else
            `define   SPEAKER1_SETTING_NUM_16      8'd15
            `define   SPEAKER1_SETTING_NUM_24      8'd1
            `define   SPEAKER1_SETTING_NUM_32      8'd2
            `define   SPEAKER1_SETTING_AMOUNT      8'd2
        `endif
    `else
        `ifdef SPEAKER1_DATA_BITS16
            `define   SPEAKER1_SETTING_NUM_16      8'd1
            `define   SPEAKER1_SETTING_NUM_24      8'd15
            `define   SPEAKER1_SETTING_NUM_32      8'd2
            `define   SPEAKER1_SETTING_AMOUNT      8'd2
        `else
            `define   SPEAKER1_SETTING_NUM_16      8'd15
            `define   SPEAKER1_SETTING_NUM_24      8'd15
            `define   SPEAKER1_SETTING_NUM_32      8'd1
            `define   SPEAKER1_SETTING_AMOUNT      8'd1
        `endif
    `endif
`else
    `ifdef SPEAKER1_DATA_BITS24
        `ifdef SPEAKER1_DATA_BITS16
            `define   SPEAKER1_SETTING_NUM_16      8'd1
            `define   SPEAKER1_SETTING_NUM_24      8'd2
            `define   SPEAKER1_SETTING_NUM_32      8'd15
            `define   SPEAKER1_SETTING_AMOUNT      8'd2
        `else
            `define   SPEAKER1_SETTING_NUM_16      8'd15
            `define   SPEAKER1_SETTING_NUM_24      8'd1
            `define   SPEAKER1_SETTING_NUM_32      8'd15
            `define   SPEAKER1_SETTING_AMOUNT      8'd1
        `endif
    `else
        `ifdef SPEAKER1_DATA_BITS16
            `define   SPEAKER1_SETTING_NUM_16      8'd1
            `define   SPEAKER1_SETTING_NUM_24      8'd15
            `define   SPEAKER1_SETTING_NUM_32      8'd15
            `define   SPEAKER1_SETTING_AMOUNT      8'd1
        `else
            `define   SPEAKER1_SETTING_NUM_16      8'd15
            `define   SPEAKER1_SETTING_NUM_24      8'd15
            `define   SPEAKER1_SETTING_NUM_32      8'd15
            `define   SPEAKER1_SETTING_AMOUNT      8'd15
        `endif
    `endif
`endif

`ifdef SPEAKER2_DATA_BITS32
    `ifdef SPEAKER2_DATA_BITS24
        `ifdef SPEAKER2_DATA_BITS16
            `define   SPEAKER2_SETTING_NUM_16      8'd1
            `define   SPEAKER2_SETTING_NUM_24      8'd2
            `define   SPEAKER2_SETTING_NUM_32      8'd3
            `define   SPEAKER2_SETTING_AMOUNT      8'd3
        `else
            `define   SPEAKER2_SETTING_NUM_16      8'd15
            `define   SPEAKER2_SETTING_NUM_24      8'd1
            `define   SPEAKER2_SETTING_NUM_32      8'd2
            `define   SPEAKER2_SETTING_AMOUNT      8'd2
        `endif
    `else
        `ifdef SPEAKER2_DATA_BITS16
            `define   SPEAKER2_SETTING_NUM_16      8'd1
            `define   SPEAKER2_SETTING_NUM_24      8'd15
            `define   SPEAKER2_SETTING_NUM_32      8'd2
            `define   SPEAKER2_SETTING_AMOUNT      8'd2
        `else
            `define   SPEAKER2_SETTING_NUM_16      8'd15
            `define   SPEAKER2_SETTING_NUM_24      8'd15
            `define   SPEAKER2_SETTING_NUM_32      8'd1
            `define   SPEAKER2_SETTING_AMOUNT      8'd1
        `endif
    `endif
`else
    `ifdef SPEAKER2_DATA_BITS24
        `ifdef SPEAKER2_DATA_BITS16
            `define   SPEAKER2_SETTING_NUM_16      8'd1
            `define   SPEAKER2_SETTING_NUM_24      8'd2
            `define   SPEAKER2_SETTING_NUM_32      8'd15
            `define   SPEAKER2_SETTING_AMOUNT      8'd2
        `else
            `define   SPEAKER2_SETTING_NUM_16      8'd15
            `define   SPEAKER2_SETTING_NUM_24      8'd1
            `define   SPEAKER2_SETTING_NUM_32      8'd15
            `define   SPEAKER2_SETTING_AMOUNT      8'd1
        `endif
    `else
        `ifdef SPEAKER2_DATA_BITS16
            `define   SPEAKER2_SETTING_NUM_16      8'd1
            `define   SPEAKER2_SETTING_NUM_24      8'd15
            `define   SPEAKER2_SETTING_NUM_32      8'd15
            `define   SPEAKER2_SETTING_AMOUNT      8'd1
        `else
            `define   SPEAKER2_SETTING_NUM_16      8'd15
            `define   SPEAKER2_SETTING_NUM_24      8'd15
            `define   SPEAKER2_SETTING_NUM_32      8'd15
            `define   SPEAKER2_SETTING_AMOUNT      8'd15
        `endif
    `endif
`endif

`ifdef SPEAKER3_DATA_BITS32
    `ifdef SPEAKER3_DATA_BITS24
        `ifdef SPEAKER3_DATA_BITS16
            `define   SPEAKER3_SETTING_NUM_16      8'd1
            `define   SPEAKER3_SETTING_NUM_24      8'd2
            `define   SPEAKER3_SETTING_NUM_32      8'd3
            `define   SPEAKER3_SETTING_AMOUNT      8'd3
        `else
            `define   SPEAKER3_SETTING_NUM_16      8'd15
            `define   SPEAKER3_SETTING_NUM_24      8'd1
            `define   SPEAKER3_SETTING_NUM_32      8'd2
            `define   SPEAKER3_SETTING_AMOUNT      8'd2
        `endif
    `else
        `ifdef SPEAKER3_DATA_BITS16
            `define   SPEAKER3_SETTING_NUM_16      8'd1
            `define   SPEAKER3_SETTING_NUM_24      8'd15
            `define   SPEAKER3_SETTING_NUM_32      8'd2
            `define   SPEAKER3_SETTING_AMOUNT      8'd2
        `else
            `define   SPEAKER3_SETTING_NUM_16      8'd15
            `define   SPEAKER3_SETTING_NUM_24      8'd15
            `define   SPEAKER3_SETTING_NUM_32      8'd1
            `define   SPEAKER3_SETTING_AMOUNT      8'd1
        `endif
    `endif
`else
    `ifdef SPEAKER3_DATA_BITS24
        `ifdef SPEAKER3_DATA_BITS16
            `define   SPEAKER3_SETTING_NUM_16      8'd1
            `define   SPEAKER3_SETTING_NUM_24      8'd2
            `define   SPEAKER3_SETTING_NUM_32      8'd15
            `define   SPEAKER3_SETTING_AMOUNT      8'd2
        `else
            `define   SPEAKER3_SETTING_NUM_16      8'd15
            `define   SPEAKER3_SETTING_NUM_24      8'd1
            `define   SPEAKER3_SETTING_NUM_32      8'd15
            `define   SPEAKER3_SETTING_AMOUNT      8'd1
        `endif
    `else
        `ifdef SPEAKER3_DATA_BITS16
            `define   SPEAKER3_SETTING_NUM_16      8'd1
            `define   SPEAKER3_SETTING_NUM_24      8'd15
            `define   SPEAKER3_SETTING_NUM_32      8'd15
            `define   SPEAKER3_SETTING_AMOUNT      8'd1
        `else
            `define   SPEAKER3_SETTING_NUM_16      8'd15
            `define   SPEAKER3_SETTING_NUM_24      8'd15
            `define   SPEAKER3_SETTING_NUM_32      8'd15
            `define   SPEAKER3_SETTING_AMOUNT      8'd15
        `endif
    `endif
`endif

//=========================================================

`ifdef SPEAKER1_IIS
    `define SPEAKER1_IIS_PCM
`endif
`ifdef SPEAKER1_PCM
    `define SPEAKER1_IIS_PCM
`endif
`ifdef SPEAKER1_PCM_32
    `define SPEAKER1_IIS_PCM
`endif

`ifdef SPEAKER2_IIS
    `define SPEAKER2_IIS_PCM
`endif
`ifdef SPEAKER2_PCM
    `define SPEAKER2_IIS_PCM
`endif
`ifdef SPEAKER2_PCM_32
    `define SPEAKER2_IIS_PCM
`endif

`ifdef SPEAKER3_IIS
    `define SPEAKER3_IIS_PCM
`endif
`ifdef SPEAKER3_PCM
    `define SPEAKER3_IIS_PCM
`endif
`ifdef SPEAKER3_PCM_32
    `define SPEAKER3_IIS_PCM
`endif

//=========================================================
//=========================================================
`ifdef     MIC0
`define MIC_NUM         0
`define MIC1_INTERFACE 15
`define MIC2_INTERFACE 15
`define MIC3_INTERFACE 15
`define MIC_MAX_PACKET_SIZE     1023
`endif

`ifdef     MIC1
`define MIC_NUM         1
`define MIC1_INTERFACE 1
`define MIC2_INTERFACE 15
`define MIC3_INTERFACE 15
`define MIC_MAX_PACKET_SIZE     1023
`endif
`ifdef     MIC2
`define MIC_NUM         2
`define MIC1_INTERFACE 1
`define MIC2_INTERFACE 3
`define MIC3_INTERFACE 15
`define MIC_MAX_PACKET_SIZE     511
`endif
`ifdef     MIC3
`define MIC_NUM         3
`define MIC1_INTERFACE 1
`define MIC2_INTERFACE 3
`define MIC3_INTERFACE 5
`define MIC_MAX_PACKET_SIZE     341
`endif

`ifdef     SPEAKER0
`define SPEAKER_NUM     0
`define SPEAKER1_INTERFACE  15
`define SPEAKER2_INTERFACE  15
`define SPEAKER3_INTERFACE  15
`define SPEAKER_MAX_PACKET_SIZE 1023
`endif
`ifdef     SPEAKER1
`define SPEAKER_NUM     1
`define SPEAKER1_INTERFACE  2*MIC_NUM + 1
`define SPEAKER2_INTERFACE  15
`define SPEAKER3_INTERFACE  15
//`define SPEAKER_MAX_PACKET_SIZE {3'b000,2'd2,1'b0,10'd1023}
`define SPEAKER_MAX_PACKET_SIZE 1023
`endif
`ifdef     SPEAKER2
`define SPEAKER_NUM     2
`define SPEAKER1_INTERFACE  2*MIC_NUM + 1
`define SPEAKER2_INTERFACE  2*MIC_NUM + 3
`define SPEAKER3_INTERFACE  15
`define SPEAKER_MAX_PACKET_SIZE 1023

`endif
`ifdef     SPEAKER3
`define SPEAKER_NUM     3
`define SPEAKER1_INTERFACE  2*MIC_NUM + 1
`define SPEAKER2_INTERFACE  2*MIC_NUM + 3
`define SPEAKER3_INTERFACE  2*MIC_NUM + 5
`define SPEAKER_MAX_PACKET_SIZE 1023
`endif