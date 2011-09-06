class BookList
  def add_book(bookNr)
    @books[bookNr]+=1
  end
  def calculate_simple_discounts(book_order)
    book_order = book_order.sort.reverse.reject { |c| c==0  }
    unless(book_order.empty?)
      @discounts[book_order.size-1] +=1;
      book_order.size.times do |i|
        book_order[i]-=1
      end
      calculate_simple_discounts(book_order)
    end
  end
  def discount_optimization
    while(@discounts[2]>0&&@discounts[4]>0)do
      @discounts[2]-=1;@discounts[4]-=1;@discounts[3]+=2
    end
  end    
  def price(order)
    @books=[0,0,0,0,0];@discounts=[0,0,0,0,0];@discount_rates=[1,0.95,0.90,0.80,0.75]
    order.each { |i| add_book(i)  }
    calculate_simple_discounts(@books)
    discount_optimization
    price = 0.0
    @discounts.size.times do |i|
      price += 8*(i+1)*@discount_rates[i]*@discounts[i]
    end
    return price
  end
end