require 'json'
require 'pathname'

ROOT = Pathname.new(__FILE__).join('..', '..').expand_path

def parse_fixture(num)
  JSON.parse(
    File.read(ROOT.join("spec/template_fixtures/slack_template_#{num}.json")),
    symbolize_names: true
  )
end

def process_example(num)
  { blocks: JSON.parse(
    Slack::BlockKit::ExecutionContext.module_eval(
      File.read(ROOT.join("examples/slack_template_#{num}.rb"))
    ).map(&:to_h).to_json, symbolize_names: true
  ) }
end

RSpec.describe 'templates' do
  ('00'..'09').each do |num|
    context "slack_template_#{num}" do
      let(:example) { process_example(num) }
      let(:fixture) { parse_fixture(num) }

      process_example(num)[:blocks].size.times do |i|
        it { expect(example[:blocks][i]).to eq(fixture[:blocks][i]) }
      end
    end
  end
end
