# A dynamic programming approach is suitable.
# Define a 2d array where each row represents the day of buying the stock
# and each column is the day of selling, where you can't sell before buying.
# The row containing the maximum number is the best day to buy,
# and the column is best day to sell
def stock_picker(prices)
    # afformentioned 2d array
    arr = []
    num_days = prices.length
    prices.each_with_index do |price, i|
        arr.push([0] * num_days)
        for j in (i...num_days)
            arr[i][j] = (prices[j]- price)  # calculate value of buying today 
                                            # and selling on day j
        end
    end
    max_profit_per_stock = arr.map {|sub| sub.max}
    best_stock = max_profit_per_stock.each_with_index.max[1]
    best_sell_day = arr[best_stock].each_with_index.max[1]
    return [best_stock, best_sell_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10]) 