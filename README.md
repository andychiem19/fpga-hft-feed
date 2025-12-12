### Multicast Market Data Feed Handler
A personal educational project developing a low-latency FPGA Ethernet/UDP feed handler for market data ingestion and trading simulation.

> **Note:** This project uses the Zybo Z7’s 100 Mbps Ethernet for demonstration and testing. In production HFT systems, feed handlers run at 10–100 Gbps, but the underlying packet parsing, multicast handling, and FPGA pipeline design principles remain largely the same and this platform suffices for educational purposes.

**Tools Used**

*This project is being developed for the Zybo Z7 SoC and its onboard FPGA, the Zynq-7020.*

`Xilinx Vivado`
`SystemVerilog`
`Questa/ModelSim`
`Visual Studio Code`
`Git`

---

#### **Learning Objectives**

- **Ethernet Communication** – understand frame structure, MAC/IP/UDP parsing
- **Real-time Data Handling** – process high-speed streaming market data with minimal latency
- **Hardware Acceleration** – use FPGA fabric for low-latency packet parsing and preprocessing
- **Protocol Parsing** – implement packet-level state machines for multicast feeds
- **AXI-Stream / FPGA Pipelines** – integrate MAC output to custom RTL logic
- **Sequence Number & Data Integrity Handling** – detect gaps, out-of-order packets, and malformed frames
- **Integration with Trading Logic** – forward processed payloads to FPGA-based order book or simulator

---

#### **File Structure**

`/rtl` –> Main SystemVerilog code for FPGA-side modules\
`/tb` –> Modular testbenches for verifying that each module works as intended
