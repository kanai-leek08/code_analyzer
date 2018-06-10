describe 'CodeAnalyzer' do

  let(:code) {
    <<-CODE
      public class JavaClassFoo {
        public void javaMethodFoo() {
          xxx
        }
      }
    CODE
  }
  let(:code2) {
    <<-CODE
      public class JavaClassBar {
        public void javaMethodBar() {
          yyy
          xxx
        }
        public void JavaMethodBiz() {
          yyy
          xxx
        }
      }
    CODE
  }

  describe 'run' do
    it 'run' do
      File.write('spec/fixtures/code.java', code)
      File.write('spec/fixtures/code2.java', code2)
      expect(CodeAnalyzer.new.run).to eq [
        {class_name: 'JavaClassBar', lines: 8},
        {class_name: 'JavaClassFoo', lines: 3},
      ]
    end
  end

  describe 'analyze' do
    it 'extract class name in java code' do
      expect(CodeAnalyzer.new.analyze(code)[:class_name]).to eq 'JavaClassFoo'
      expect(CodeAnalyzer.new.analyze(code2)[:class_name]).to eq 'JavaClassBar'
    end
    it 'extract number of class lines in java code ' do
      expect(CodeAnalyzer.new.analyze(code)[:lines]).to eq 3
      expect(CodeAnalyzer.new.analyze(code2)[:lines]).to eq 8
    end
  end
end
