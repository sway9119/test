def isIsolate(string)
  ary = string.split.downcase.split("").uniq
  return ary.length === string.size
end