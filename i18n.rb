module I18n
  def plural_form(count, one:, few:, many:)
    return many if count >= 11 && count <= 19

    units = count % 10
    return many if count == 0 || (5..9).include?(units)
    return few if (2..4).include?(units)
    one
  end
end
