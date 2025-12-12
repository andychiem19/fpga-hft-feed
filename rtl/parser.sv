module parser (
    input   logic clk,
    input   logic rst_n,
    input   logic [7:0] tdata,
    input   logic tvalid,
    input   logic tlast,

    output  logic [7:0] packet,
    output  logic packet_valid,
    output  logic packet_end
)

typedef enum logic [2:0] {
    IDLE,
    READ_ETH,
    READ_IP,
    READ_UDP,
    PAYLOAD,
    ERROR
} parser_state;

parser_state state;

// add necessary registers here
logic [2:0] preamble_count;

// main parser FSM
always_ff(@posedge clk or negedge rst_n) begin
    if !(rst_n) begin
        state <= IDLE;
        preamble_count <= 0;
    end 
    
    else begin
        case(state)
            IDLE: begin
                if (tvalid) begin
                    if (preamble_count < 7) begin 
                        if (tdata == 8'h55) begin // checks for 7 consecutive preamble bits
                            preamble_count <= preamble_count + 1;
                        end 
                        
                        else begin
                            preamble_count <= 0;
                        end
                    end 
                    
                    else if (preamble_count == 7) begin
                        if (tdata == 8'hD5) begin // SFD detected, move to READ_ETH
                            preamble_count <= 0;
                            state <= READ_ETH;
                        end 
                        
                        else begin // wrong byte, resetting
                            preamble_count <= 0;
                        end
                    end
                end
            end

            READ_ETH: begin
            end

            READ_IP: begin
            end

            READ_UDP: begin
            end

            PAYLOAD: begin
            end

            ERROR: begin
                // resets FSM and registers when an error state is reached
                state <= IDLE;
            end
    end
end
