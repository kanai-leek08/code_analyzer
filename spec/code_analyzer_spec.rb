describe 'CodeAnalyzer' do
  it 'extract class name in java code' do
    code = <<-CODE
      public class ClassName {
        public void methodName() {
          xxx
        }
      }
    CODE
    expect(CodeAnalyzer.new.run(code)).to eq 'ClassName'
    code = <<-CODE
      public class SomeThingDoClass {
        public void methodName() {
          xxx
        }
      }
    CODE
    expect(CodeAnalyzer.new.run(code)).to eq 'SomeThingDoClass'


  end
end
