class DashboardsController < ApplicationController
  def index
    authorize(:dashboard)
    statistics
  end

  private

  def statistics
    @total_sum = policy_scope(Item).pluck(:total).sum
    @total_categories = policy_scope(Item.joins(:category)).group(category: :name).sum(:total)

    @sum_months = policy_scope(Item.joins(:receipt)).group('EXTRACT(MONTH FROM receipt.shopped_at)').reorder(nil).sum(:total)

    @sum_months_categories = {}
    @sum_months.keys.each do |month|
      @sum_months_categories[month] = {}
    end

    policy_scope(Item).joins(:receipt)
                      .joins(:category)
                      .group('EXTRACT(MONTH FROM receipt.shopped_at)')
                      .group(category: :name)
                      .reorder(nil)
                      .sum(:total).each do |groups, value|
                        month = groups[0]
                        category = groups[1]
                        @sum_months_categories[month][category] = value
    end
  end
end
