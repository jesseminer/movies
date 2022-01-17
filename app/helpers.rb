def nice_length(minutes)
  days = minutes / 1440
  hours = (minutes / 60) % 24
  minutes = minutes % 60

  days_string = "#{days} days" if days > 0

  if hours == 1
    "#{days_string} #{hours} hour #{minutes} minutes"
  else
    "#{days_string} #{hours} hours #{minutes} minutes"
  end
end
