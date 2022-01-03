def nice_length(minutes)
  hours = minutes / 60
  minutes = minutes % 60

  if hours == 1
    "#{hours} hour #{minutes} minutes"
  else
    "#{hours} hours #{minutes} minutes"
  end
end
