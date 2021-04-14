// Verilog HDL for "UofU_Digital_v1_2", "MUX2X2" "behavioral"

module MUX2X2 (Y, A, B, S);
    output Y;
    input A;
    input B;
    input S;

   wire   Sbar, Amid, Bmid, Ymid;
   
   not _i0 (Sbar, S);
   and _i1 (Amid, A, Sbar);
   and _i2 (Bmid, B, S);
   nor _i3 (Ymid, Amid, Bmid);
   not _i4 (Y, Ymid);

   specify
      (A => Y) = (1.0, 1.0);
      (B => Y) = (1.0, 1.0);
      (S => Y) = (1.0, 1.0);
   endspecify
   
endmodule
