;buildInfoPackage: chisel3, version: 3.0-SNAPSHOT, scalaVersion: 2.11.11, sbtVersion: 0.13.16, builtAtString: 2017-09-16 03:49:13.973, builtAtMillis: 1505533753973
circuit Sort : 
  module Sort : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputs : Fixed<16><<8>>[5], flip newInputs : UInt<1>, outputs : Fixed<16><<8>>[5], sortDone : UInt<1>}
    
    clock is invalid
    reset is invalid
    io is invalid
    reg orderedRegs : Fixed<64><<16>>[5], clock @[Sort.scala 21:25]
    reg busy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Sort.scala 22:29]
    reg sortCounter : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[Sort.scala 23:29]
    reg isEvenCycle : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Sort.scala 24:29]
    when io.newInputs : @[Sort.scala 26:22]
      orderedRegs[0] <= io.inputs[0] @[Sort.scala 28:60]
      orderedRegs[1] <= io.inputs[1] @[Sort.scala 28:60]
      orderedRegs[2] <= io.inputs[2] @[Sort.scala 28:60]
      orderedRegs[3] <= io.inputs[3] @[Sort.scala 28:60]
      orderedRegs[4] <= io.inputs[4] @[Sort.scala 28:60]
      busy <= UInt<1>("h01") @[Sort.scala 30:10]
      sortCounter <= UInt<1>("h00") @[Sort.scala 31:17]
      isEvenCycle <= UInt<1>("h00") @[Sort.scala 32:17]
      skip @[Sort.scala 26:22]
    else : @[Sort.scala 34:19]
      when busy : @[Sort.scala 34:19]
        node _T_42 = eq(isEvenCycle, UInt<1>("h00")) @[Sort.scala 35:20]
        isEvenCycle <= _T_42 @[Sort.scala 35:17]
        node _T_44 = add(sortCounter, UInt<1>("h01")) @[Sort.scala 37:32]
        node _T_45 = tail(_T_44, 1) @[Sort.scala 37:32]
        sortCounter <= _T_45 @[Sort.scala 37:17]
        node _T_47 = gt(sortCounter, UInt<3>("h05")) @[Sort.scala 38:22]
        when _T_47 : @[Sort.scala 38:37]
          busy <= UInt<1>("h00") @[Sort.scala 39:12]
          skip @[Sort.scala 38:37]
        when isEvenCycle : @[Sort.scala 42:23]
          node _T_49 = gt(orderedRegs[0], orderedRegs[1]) @[Sort.scala 45:21]
          when _T_49 : @[Sort.scala 45:29]
            orderedRegs[0] <= orderedRegs[1] @[Sort.scala 46:18]
            orderedRegs[1] <= orderedRegs[0] @[Sort.scala 47:18]
            skip @[Sort.scala 45:29]
          node _T_50 = gt(orderedRegs[2], orderedRegs[3]) @[Sort.scala 45:21]
          when _T_50 : @[Sort.scala 45:29]
            orderedRegs[2] <= orderedRegs[3] @[Sort.scala 46:18]
            orderedRegs[3] <= orderedRegs[2] @[Sort.scala 47:18]
            skip @[Sort.scala 45:29]
          skip @[Sort.scala 42:23]
        else : @[Sort.scala 52:16]
          node _T_51 = gt(orderedRegs[1], orderedRegs[2]) @[Sort.scala 55:21]
          when _T_51 : @[Sort.scala 55:29]
            orderedRegs[1] <= orderedRegs[2] @[Sort.scala 56:18]
            orderedRegs[2] <= orderedRegs[1] @[Sort.scala 57:18]
            skip @[Sort.scala 55:29]
          node _T_52 = gt(orderedRegs[3], orderedRegs[4]) @[Sort.scala 55:21]
          when _T_52 : @[Sort.scala 55:29]
            orderedRegs[3] <= orderedRegs[4] @[Sort.scala 56:18]
            orderedRegs[4] <= orderedRegs[3] @[Sort.scala 57:18]
            skip @[Sort.scala 55:29]
          skip @[Sort.scala 52:16]
        skip @[Sort.scala 34:19]
    node _T_54 = eq(busy, UInt<1>("h00")) @[Sort.scala 64:18]
    io.sortDone <= _T_54 @[Sort.scala 64:15]
    io.outputs[0] <= orderedRegs[0] @[Sort.scala 68:9]
    io.outputs[1] <= orderedRegs[1] @[Sort.scala 68:9]
    io.outputs[2] <= orderedRegs[2] @[Sort.scala 68:9]
    io.outputs[3] <= orderedRegs[3] @[Sort.scala 68:9]
    io.outputs[4] <= orderedRegs[4] @[Sort.scala 68:9]
    
