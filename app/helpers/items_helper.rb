module ItemsHelper
  def options_for_items

    options_for_select({ "Basic" => "$20", "Plus" => "$40" }, "$40")
    options_for_select([ "Denmark", ["USA", { class: 'bold' }], "Sweden" ], ["USA", "Sweden"])
    options_for_select([["Dollar", "$", { class: "bold" }], ["Kroner", "DKK", { onclick: "alert('HI');" }]])
    options_for_select(Item.pluck(:name).uniq, nil)
    Item.joins(receipt: :team).all


  end
end
