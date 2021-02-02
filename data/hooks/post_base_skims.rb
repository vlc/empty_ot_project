if @run_spec.create_skims
  sc = OtSkimCube.new
  pmturis = sc.to_a.select { |pmturi|
    pmturi[0] == 1 && pmturi[2] == 'AM'.to_time && pmturi[4] == 12  && pmturi[5] == @run_spec.start_iteration
  }
  Logger.showProgress("Copying AM base skims to AM1 time period", pmturis) { |pmturi|
    dest = pmturi.dup
    dest[2] = 'AM1'.to_time
    p "Copying #{pmturi.inspect} => #{dest.inspect}"
    sc.copy(pmturi, dest)
  }
end
