def reformat_languages(languages)
  new_hash = {}
  # Add a :style key at lower level in hash whose value consists of empty array
  languages.each do |style, language|
    language.each do |name, attributes|
      attributes[:style] = []
    end
  end
  languages.each do |style, language|
    language.each do |name, attributes|
#  Is language already included? If so, combine style info
      if new_hash.has_key?(name)
        new_hash[name][:style] << style
      else
        attributes[:style] << style
        new_hash[name] = attributes
      end
    end
  end
  new_hash
end
