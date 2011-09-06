require 'book_list'

class PotterKata
  def price(books)
    return 0 if (books==[])
    return 8 if (books.length==1)
    cost = 0
    while(!books.empty? && books.all? { |i| i>=0 && i<=4  })
      cost +=30
      5.times do
        |i|
        books.delete(i)
      end
    end
    while(!books.empty? && books.all? { |i| i>=0 && i<=3  })
      cost +=25.6
      4.times do
        |i|
        books.delete(i)
      end
    end
    while(!books.empty? && books.all? { |i| i>=1 && i<=4  })
      cost +=25.6
      4.times do
        |i|
        books.delete(i+1)
      end
    end
    
    # test 1234
    #    cost= 8*books.length
    #    list = BookList.new
    #    books.each do
    #      |cur_book|
    #      fail("This book does not exist yet") if cur_book>4
    #      list.add_book(cur_book)
    #    end
    return cost
  end
end


#puts [0,1,2,3,4,0,1,2,3,4].all? { |i| (0..4).include?(i)  }
#puts [0,1,2,3,4,0,1,2,3,4].all? { |i| (i>=0&&i<5)  }

