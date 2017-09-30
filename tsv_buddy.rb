# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: String w/ TSV to @data. parameter: tsv - a String in TSV format
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split("\n")
    keys = lines[0].split("\t")
    @data = (lines[1..-1]).map { |val| Hash[keys.zip(val.split("\t"))] }
  end

  # to_tsv: converts @data to tsv string.
  # returns: String in TSV format
  def to_tsv
    tsv_files = ''
    tsv_files << @data[0].keys.join("\t") + "\n"
    @data.each { |line| tsv_files << line.values.join("\t") + "\n" }
    tsv_files
  end
end
