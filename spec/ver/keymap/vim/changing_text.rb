require_relative '../vim'

VER.spec keymap: 'vim', hidden: false do
  describe 'Keymap for VIM' do
    describe 'Changing text' do
      # change means: delete text and enter Insert mode
      behaves_like :destructive_key_spec

      key 'r{char}', 'replace N characters with {char}' do
        type 'ra'
        buffer.get('insert linestart', 'insert lineend').should ==
          "anventore voluptatibus dolorem assumenda."
        type '5ra'
        buffer.get('insert linestart', 'insert lineend').should ==
          "aaaaatore voluptatibus dolorem assumenda."
      end

      key 'gr{char}', 'replace N characters without affecting layout' do
        skip # obsucre and not that useful, queue
      end

      key 'R', 'enter Replace mode (repeat the entered text N times)' do
        type 'R'
        buffer.minor_mode?(:replace).should.not.be.nil
        type 'Adventures are waiting for you'
        buffer.minor_mode?(:replace).should.not.be.nil
        buffer.get('1.0', '1.0 lineend').should ==
          "Adventures are waiting for you assumenda."
        type '<Escape>'
        buffer.minor_mode?(:replace).should.be.nil
        buffer.get('1.0', '1.0 lineend').should ==
          "Adventures are waiting for you assumenda."

        type '03R'
        buffer.minor_mode?(:replace).should.not.be.nil
        type 'go go gadget replacing '
        buffer.minor_mode?(:replace).should.not.be.nil
        buffer.get('1.0', '1.0 lineend').should ==
          "go go gadget replacing for you assumenda."
        type '<Escape>'
        buffer.minor_mode?(:replace).should.be.nil
        buffer.get('1.0', '1.0 lineend').should ==
          "go go gadget replacing go go gadget replacing go go gadget replacing go go gadget replacing for you assumenda."
      end

      key 'gR', 'enter virtual Replace mode: Like Replace mode but without affecting layout' do
        skip # obsucre and not that useful, queue
      end

      key '{visual}r{char}', 'in Visual block mode: Replace each char of the selected text with {char}' do
        type '3l<Control-v>3j5lrx'
        buffer.get('1.0', '6.0').should == <<-VALUE
Invxxxxxx voluptatibus dolorem assumenda.
Volxxxxxxs officiis quidem nemo est.
Quixxxxxxique quia voluptatem.
Sitxxxxxxtur vel aperiam et ab.
Quam dolorem dignissimos perferendis.
        VALUE
      end

      key 'c{motion}', 'change the text that is moved over with {motion}' do
        type '3cl'
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        buffer.get('1.0', '1.0 lineend').should == "entore voluptatibus dolorem assumenda."

        # this is a rabbit-hole, don't fix until it becomes annoying.
        # type 'c3l'
        # buffer.minor_mode?(:insert).should.not.be.nil
        # type '<Escape>'
        # buffer.minor_mode?(:insert).should.be.nil
        # buffer.get('1.0', '1.0 lineend').should == "ore voluptatibus dolorem assumenda."
      end

      key '{visual}c', 'change the highlighted text' do
        type 'v2l3lc'
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        buffer.get('1.0', '2.0').should == "ore voluptatibus dolorem assumenda.\n"
      end

      keys 'cc', 'S', 'change N lines' do |key|
        type "#{key}"
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        insert.index.should == '1.0'
        buffer.get('1.0', '3.0').should == "\nVoluptates officiis quidem nemo est.\n"

        type "3#{key}"
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        insert.index.should == '1.0'
        buffer.get('1.0', '3.0').should == "\nSit pariatur vel aperiam et ab.\n"
      end

      key 'C', 'change to the end of the line (and N-1 more lines)' do |key|
        buffer.insert = '1.5'
        type key
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        insert.index.should == '1.5'
        buffer.get('1.0', '3.0').should == "Inven\nVoluptates officiis quidem nemo est.\n"

        buffer.insert = '2.5'
        type 3, key
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        insert.index.should == '2.5'
        buffer.get('1.0', '4.0').should == "Inven\nVolup\nQuam dolorem dignissimos perferendis.\n"
      end

      key 's', 'change N characters' do |key|
        type key, 'Winds of change: I'
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        buffer.get('1.0', '2.0').should == "Winds of change: Inventore voluptatibus dolorem assumenda.\n"

        type 0, 28, key, 'Winds of change: V'
        buffer.minor_mode?(:insert).should.not.be.nil
        type '<Escape>'
        buffer.minor_mode?(:insert).should.be.nil
        buffer.get('1.0', '2.0').should == "Winds of change: Voluptatibus dolorem assumenda.\n"
      end

      key '{visual}c', 'in Visual block mode: Change each of the selected lines with the entered text' do
        skip
      end

      key '{visual}C', 'in Visual block mode: Change each of the selected lines until end-of-line with the entered text' do
        skip
      end

      key '~', 'switch case for N characters and advance cursor' do
        skip
      end
    end
  end
end
__END__

      key '{visual}~', 'switch case for highlighted text' do
        skip
      end

      key '{visual}u', 'make highlighted text lowercase' do
        skip
      end

      key '{visual}U', 'make highlighted text uppercase' do
        skip
      end

      key 'g~{motion}', 'switch case for the text that is moved over with {motion}' do
        skip
      end

      key 'gu{motion}', 'make the text that is moved over with {motion} lowercase' do
        skip
      end

      key 'gU{motion}', 'make the text that is moved over with {motion} uppercase' do
        skip
      end

      key '{visual}g?', 'perform rot13 encoding on highlighted text' do
        skip
      end

      key 'g?{motion}', 'perform rot13 encoding on the text that is moved over with {motion}' do
        skip
      end

      key '<Control-a>', 'add N to the number at or after the cursor' do
        skip
      end

      key '<Control-x>', 'subtract N from the number at or after the cursor' do
        skip
      end

      key '<{motion}', 'move the lines that are moved over with {motion} one shiftwidth left' do
        skip
      end

      key '<<', 'move N lines one shiftwidth left' do
        skip
      end

      key '>{motion}', 'move the lines that are moved over with {motion} one shiftwidth right' do
        skip
      end

      key '>>', 'move N lines one shiftwidth right' do
        skip
      end

      key 'gq{motion}', 'format the lines that are moved over with {motion} to "textwidth" length' do
        skip
      end

      key ':[range]ce[nter] [width]', 'center the lines in [range]' do
        skip
      end

      key ':[range]le[ft] [indent]', 'left-align the lines in [range] (with [indent])' do
        skip
      end

      key ':[range]ri[ght] [width]', 'right-align the lines in [range]' do
        skip
      end
    end
  end
end
