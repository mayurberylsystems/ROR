require 'roo'


xsl = Roo::Spreadsheet.open('/home/beryl/attendees-50566358339-1.xlsx')

xsl.sheets.each do |sheet_name|
  puts ''
  puts sheet_name
  puts '--------------'
  sheet = xsl.sheet(sheet_name)

  if !sheet.nil?
    last_row    = sheet.last_row
    last_column = sheet.last_column

    for col in 1..last_column
    	if col==1
    		for row in 1..last_row
    			if sheet.cell(row,col).to_s.size >= 23
    				puts "EVENT :" + sheet.cell(row,col).to_s
    			end
    		end
    	end
    end

    for col in 1..last_column
    	if col==2
    		for row in 1..last_row
    			if !sheet.cell(row,col).nil?
    				puts "first name :" + sheet.cell(row,col).to_s
    			end
    		end
    	end
    end

    for col in 1..last_column
    	if col==1
    		for row in 1..last_row
    			if !sheet.cell(row,col).nil? && sheet.cell(row,col).size <= 9
    				puts "last name :" + sheet.cell(row,col).to_s
    			elsif row
    			end
    		end
    	end
    end

    for col in 1..last_column
    	if col==3
    		for row in 1..last_row
    			if !sheet.cell(row,col).nil? 
    				puts "Qty :" + sheet.cell(row,col).to_s
    			end
    		end
    	end
    end

    for col in 1..last_column
    	if col==4
    		for row in 1..last_row
    			if !sheet.cell(row,col).nil? 
    				puts "Ticket Type :" + sheet.cell(row,col).to_s
    			end
    		end
    	end
    end
    for col in 1..last_column
    	if col==5
    		for row in 1..last_row
    			if !sheet.cell(row,col).nil? 
    				puts "Payment status :" + sheet.cell(row,col).to_s
    			end
    		end    	
    	end
    end
    for col in 1..last_column
    	if col == 1
    		for row in 1..last_row
    			if row  == 5 
    				puts "Timings :" + sheet.cell(row,col).to_s
    			end
    		end
    	end
    end
    for col in 1..last_column
    		for row in 1..last_row
    			if row  == 5 && col == 1
    				puts "Timings :" + sheet.cell(row,col).to_s
    			elsif row == 6 && col == 1
    				puts "Location :" + sheet.cell(row,col).to_s	
    			end
    		end
    	end
   end
end