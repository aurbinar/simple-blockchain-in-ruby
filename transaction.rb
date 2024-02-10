def get_transactions_data

  transactions_block ||= []
  blank_transaction = Hash[from: "", to: "",
                           what: "", qty: 0]
  loop do
    puts "" 
    puts "Enter your name for the new transaction"
    from = gets.chomp
    puts "" 
    puts "What do you want to send ?"
    what = gets.chomp
    puts "" 
    puts "How much quantity ?"
    qty  = gets.chomp
    puts "" 
    puts "Who do you want to send it to ?"
    to 	 = gets.chomp

    # Validar que los campos no estén vacíos
    if from.empty? || what.empty? || qty.empty? || to.empty?
      puts "Error: Todos los campos deben ser completados."
      next
    end

    # Validar que qty sea un número
    unless qty.match?(/\A\d+(\.\d+)?\z/)
      puts "Error: La cantidad debe ser un número."
      next
    end

    # Validar que qty sea un número positivo
    unless qty.to_f.positive?
      puts "Error: La cantidad debe ser un número positivo."
      next
    end

    transaction = Hash[from: "#{from}", to: "#{to}", 
                       what: "#{what}", qty: qty]
    transactions_block << transaction

    puts "" 
    puts "Do you want to make another transaction for this block ? (Y/n)"
    new_transaction = gets.chomp.downcase

    if new_transaction == "y"
      self
    else
      return transactions_block
      break
    end
  end
end