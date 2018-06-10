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
  it 'get summary' do
    File.write('spec/fixtures/code.java', code)
    File.write('spec/fixtures/code2.java', code2)
    expect(CodeAnalyzer.new.summary).to eq [
      {class_name: 'JavaClassFoo', lines: 3},
      {class_name: 'JavaClassBar', lines: 8},
    ]
  end
  it 'extract class name in java code' do
    expect(CodeAnalyzer.new.run(code)[:class_name]).to eq 'JavaClassFoo'
    expect(CodeAnalyzer.new.run(code2)[:class_name]).to eq 'JavaClassBar'
  end
  it 'extract number of class lines in java code ' do
    expect(CodeAnalyzer.new.run(code)[:lines]).to eq 3
    expect(CodeAnalyzer.new.run(code2)[:lines]).to eq 8
  end
end
