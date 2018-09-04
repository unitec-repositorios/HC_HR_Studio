class Schedule < ApplicationRecord
    belongs_to :employees
    accepts_nested_attributes_for :employees

     # def self.import(file)
      #  spreadsheet = open_spreadsheet(file)
     #   header = spreadsheet.row(1)
      #  (2..spreadsheet.last_row).each do |i|
       #   row = Hash[[header, spreadsheet.row(i)].transpose]
       #   employee = find_by_id(row["id"]) || new
        #  employee.attributes = row.to_hash.slice(*accessible_attributes)
        #  employee.save!
       # end
      # end
      
      def self.import(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::Csv.new(file.path, packed: false, file_warning: :ignore)
        when ".XLS" 
          then archivo = Roo::Excel.new(file.path,packed: false, file_warning: :ignore)
          sheet = archivo.sheet(2)
          fecha = sheet.cell(4,2)
          hora_in = sheet.cell(12,32)
          hora_out = sheet.cell(12,37)
          nuevo = Schedule.new :fecha => fecha, :hora_entrada => hora_in, :hora_salida => hora_out
          nuevo.save!
          #id = sheet.cell(4,40)
          #id = '21'
          puts nuevo.hora_entrada

          #puts Employee.select(:name).where("employee_id_number = ?",id)
        when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
        
      end
end
