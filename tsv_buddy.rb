# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: String w/ TSV to @data. parameter: tsv - a String in TSV format
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = line_splitter(tsv)
    keys = key_splitter(lines)
    yml_format(lines, keys)
  end

  # to_tsv: converts @data to tsv string.
  # returns: String in TSV format (tsv_files)
  def to_tsv
    tsv_format(tsv_files = '')
    tsv_files
  end

  private

  # line_spliiter : split into line
  def line_splitter(tsv)
    tsv.split("\n")
  end

  # key_spliiter : split keys in the first row
  def key_splitter(lines)
    lines[0].split("\t")
  end

  # yml_format : process converting tsv lines to @data
  def yml_format(lines, keys)
    @data = (lines[1..-1]).map { |val| Hash[keys.zip(val.split("\t"))] }
  end

  # tsv_converter: process converting @data to tsv string
  def tsv_format(tsv_files)
    tsv_files << @data[0].keys.join("\t") + "\n"
    @data.each { |line| tsv_files << line.values.join("\t") + "\n" }
  end
end
