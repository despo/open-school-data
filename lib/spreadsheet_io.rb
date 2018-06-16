class SpreadsheetIo
  require 'csv'
  attr_reader :url, :headers

  def initialize
    @url = './data/edubaseallstatefunded20180615.csv'
    @headers = CSV.parse_line(IO.foreach(url, encoding: 'windows-1251:utf-8', mode: 'r').first)
    self
  end

  def search(keyword)
    result = scan_file(url, escape(keyword)).map { |line| parse_line(line) }.to_a
    result.map { |s| Hash[headers.zip(s)] }
  end

  def find(keyword)
    school = scan_file(url,escape(keyword)).take(1).map { |r| parse_line(r) }.to_a
    school.map { |s| Hash[headers.zip(s)] }.first
  end

  private

  def escape(string)
    /#{string}/
  end

  def parse_line(line)
    CSV.parse_line(line)
  end

  def scan_file(url, keyword)
    IO.foreach(url, encoding: 'windows-1251:utf-8', mode: 'r').lazy.grep(keyword)
  end
end
