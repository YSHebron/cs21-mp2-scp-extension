# **CS 21 Project 2: Extending a 32-bit CPU Instruction Set.**
For this project, we were tasked to extend the MIPS 32-bit Single Cycle Processor (SCP) (Harris & Harris, 2013) instruction set (please see `CS21_Project2_Specs.pdf` for full specifications).

A nuanced understanding of **Hardware Definition Language** (HDL) (specifically **SystemVerilog**) is key to succeeding on this project. We modified the processor to accomodate 5 new instructions:
1. Shift left logical (sll)
2. Store byte (sb)
3. Branch on less than or equal (ble)
4. Load immediate (li)
5. Zero-from-right (zfr)

Please see my Documentation Intro (`For Submission\Hebron_Yenzy_202003090_LAB4.pdf`) or the MIPS Green Sheet (`MIPS Green Sheet (Berkeley).pdf`) for the MIPS32 instruction formats. You may also consult Appendix B of Harris & Harris (2013) or the Project 2 Specs for the complete instruction set and their expected effect.

Our technical documentation skills were also sharpened by this project, one that require line-by-line explanation of code. Included in the documentation, per instruction, are:

The video documentation may be accessed through this link:

### **Requirements**
- Windows 10 or higher (for running the latest Xilinx Vivado distribution).
- 
- MARS v4.5. A Java program for teaching, compiling, and running MIPS32 Assembly. Download: http://courses.missouristate.edu/kenvollmar/mars/download.htm

Note: There is already a packaged `mars.jar` file in `"For Submission\"`.

### **Running the Program**
The sudoku solvers can be run in two ways.

1. **Through the MARS GUI.** In the menu bar, click File>Open, then navigate to the sudoku solver assembly files. Afterwards, in the toolbar, click Assemble (tool and wrench icon) then click Run (play icon). In the lower left, the execution pane will be visible through which you can paste test cases such as those found in the included 4x4.txt and 9x9.txt files in `"For Submission\"`. Note that inputting test cases through the MARS GUI can only be done line-by-line.
2. **Through cmd.** Open your command line, `cd` to `"For Submission\"` (where `mars.jar` already exists), then run `java -jar mars.jar <file_name>`. File name could be `4x4solver.asm` or `9x9solver.asm`. You may now input your valid test cases to the cmd. 
### **Sample I/O**
For the 4x4 solver, an input is formatted as:
```
1000
0001
0400
0020
```

Which outputs:
```
1342
4231
2413
3124
```

For the 9x9 solver, an input is formatted as:
```
005800009
210000050
070900600
000201035
000000000
780405000
004006020
030000061
600003500
```
Which outputs:
```
465812379
219367458
378954612
946271835
523698147
781435296
154786923
832549761
697123584
```

**Reference**\
Harris, D. M., & Harris, S. (2013). *Digital Design and Computer Architecture (2nd ed.).* Elsevier Inc. https://doi.org/10.1016/C2011-0-04377-6

---
Yenzy Urson S. Hebron

University of the Philippines Diliman

2nd Semester A.Y. 2021-2022

© Course Materials by Sir Wilson Tan and Sir Ivan Carlo Balingit