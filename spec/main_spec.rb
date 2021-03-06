describe "Application 'MemoryTest'" do
  # This spec fails
  it "async should work" do
    called = "anything"
    MetaBasic.long_operation do
      called = true
      resume
    end

    wait_max 5 do
      called.should == true
    end
  end

  # This spec works
  it "async should work ivar" do
    @called = false
    MetaBasic.long_operation do
      @called = true
      resume
    end

    wait_max 5 do
      @called.should == true
    end
  end

  # This spec works (note the addition p 'hello')
  it "async should work with puts" do
    called = false
    MetaBasic.long_operation do
      called = true
      p "hello"
      resume
    end

    wait_max 5 do
      called.should == true
    end
  end

  # This spec fails
  it "async should work nested" do
    called = false
    MetaNested.long_operation do
      called = true
      resume
    end

    wait_max 5 do
      called.should == true
    end
  end

  # This spec works
  it "async should work nested ivar" do
    @called = false
    MetaNested.long_operation do
      @called = true
      resume
    end

    wait_max 5 do
      @called.should == true
    end
  end
end
