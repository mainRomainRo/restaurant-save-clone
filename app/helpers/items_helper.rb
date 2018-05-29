module ItemsHelper

    def calcul_total
      @total = 0
      @user = current_user
      @added_items = @user.added_items
      @added_items.each do |item|
        @total += item.price
      end
      p "salope"
      p @total
      p "bab"
      return @total
    end

end
