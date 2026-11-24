# System Profile
| Component | Specification |
| :--- | :--- |
| **CPU Model & Cores** | Intel(R) Core(TM) i7-14700HX - 14 Cores (28 Logival CPUs) |
| **Memory (RAM)** | 7.6 GiB Total / 7.0 GiB Available (WSL2 allocation) |
| **Primary Storage** | 1 TB SSD (`/dev/sdd`, mounted at `/`) |
| **OS 7 Kernel Version** | GNU/Linux (WSL2) - Kernel `6.18.58.1-microsoft-standard-WSL2`

## Binary Number Representation

### 1. Decimal `75` to Binary (Repeated Division by 2)
| Division | Quotient | Remainder |
| :--- | :--- | :--- |
| 75 / 2 | 37 | 1 |
| 37 / 2 | 18 | 1 |
| 18 / 2 | 9 | 0 |
| 9 / 2 | 4 | 1 |
| 4 / 2 | 2 | 0 |
| 2 / 2 | 1 | 0 |
| 1 / 2 | 0 | 1 |
Reading the remainders from **bottom to top**: **(75) = (1001011)**
### 2. Binary '110101' to Deciml (Positional Weights)
| Binary Digit | 1 | 1 | 0 | 1 | 0 | 1 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | 
| **Power of 2** | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| ** Place Value** | 32 | 16 | 8 | 4 | 2 | 1 |
| **Contribution** | 32 | 16 | 0 | 4 | 0 | 1 |
Adding the contributions together : `32 + 16 + 4 + 1 = 53`
Therefore: **(110101) = (53)**
### 3. Why Do Cpmputers Use Binary?
Computers use binary internally because their electronic circuits and transistors reliably represent and switch between two distinct voltage states-ON (`1`) and OFF (`0`)-which prevents signal ambiguity and simplifies hardware design.

