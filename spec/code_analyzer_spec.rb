describe 'CodeAnalyzer' do
  let(:code) {
    <<-CODE
      public class ClassName {
        public void methodName() {
          xxx
        }
      }
    CODE
  }
  let(:code2) {
    <<-CODE
      public class SomeThingDoClass {
        public void methodName() {
          yyy
          xxx
        }
        public void methodName2() {
          yyy
          xxx
        }
      }
    CODE
  }
  it 'extract class name in java code' do
    expect(CodeAnalyzer.new.run(code)[:class_name]).to eq 'ClassName'
    expect(CodeAnalyzer.new.run(code2)[:class_name]).to eq 'SomeThingDoClass'
  end
  it 'extract number of class lines in java code ' do
    expect(CodeAnalyzer.new.run(code)[:lines]).to eq 3
    expect(CodeAnalyzer.new.run(code2)[:lines]).to eq 8
  end
end
