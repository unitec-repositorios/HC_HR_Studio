class Schedule < ApplicationRecord
    belongs_to :employees
    accepts_nested_attributes_for :employees
      
      def self.import(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::Csv.new(file.path, packed: false, file_warning: :ignore)
        when ".xls" 
          then archivo = Roo::Excel.new(file.path,packed: false, file_warning: :ignore)
          sheet = archivo.sheet(0)
          fecha = sheet.cell(4,2)
          #fecha = sheet.cell(12,31)
          idEmp1 = sheet.cell(4,10)
          idEmp2 = sheet.cell(4,25)
          idEmp3 = sheet.cell(4,40)
          $columna_hora_in1 = 32
          $columna_hora_out1 = 37
          puts sheet
          $i = 12
          while $i < 18 do
            hora_in = sheet.cell($i,$columna_hora_in1)
            hora_out = sheet.cell(12,$columna_hora_out1)
            nuevo = Schedule.new :fecha => fecha, :hora_entrada => hora_in, :hora_salida => hora_out, :employees_id => idEmp1
            nuevo.save!
            #id = sheet.cell(4,40)
            #id = '21'
            #puts sheet
            $i += 1
          end
          $columna_hora_in2 = 2
          $columna_hora_out2 = 7
          $i = 12
          while $i < 18 do
            hora_in = sheet.cell($i,$columna_hora_in2)
            hora_out = sheet.cell(12,$columna_hora_out2)
            nuevo = Schedule.new :fecha => fecha, :hora_entrada => hora_in, :hora_salida => hora_out, :employees_id => idEmp2
            nuevo.save!
            #id = sheet.cell(4,40)
            #id = '21'
            #puts sheet
            $i += 1
          end

          $columna_hora_in3 = 2
          $columna_hora_out3 = 7
          $i = 12
          while $i < 18 do
            hora_in = sheet.cell($i,$columna_hora_in3)
            hora_out = sheet.cell(12,$columna_hora_out3)
            nuevo = Schedule.new :fecha => fecha, :hora_entrada => hora_in, :hora_salida => hora_out, :employees_id => idEmp3
            nuevo.save!
            #id = sheet.cell(4,40)
            #id = '21'
            #puts sheet
            $i += 1
          end
         
          #puts Employee.select(:name).where("employee_id_number = ?",id)

        when ".XLS" 
          then archivo = Roo::Excel.new(file.path,packed: false, file_warning: :ignore)
          sheet = archivo.sheet(0)
          fecha = sheet.cell(4,2)
          #fecha = sheet.cell(12,31)
          idEmp1 = sheet.cell(4,10)
          idEmp2 = sheet.cell(4,25)
          idEmp3 = sheet.cell(4,40)
          $columna_hora_in1 = 32
          $columna_hora_out1 = 37
          puts sheet
          $i = 12
          while $i < 18 do
            hora_in = sheet.cell($i,$columna_hora_in1)
            hora_out = sheet.cell(12,$columna_hora_out1)
            nuevo = Schedule.new :fecha => fecha, :hora_entrada => hora_in, :hora_salida => hora_out, :employees_id => idEmp1
            nuevo.save!
            #id = sheet.cell(4,40)
            #id = '21'
            #puts sheet
            $i += 1
          end
          $columna_hora_in2 = 2
          $columna_hora_out2 = 7
          $i = 12
          while $i < 18 do
            hora_in = sheet.cell($i,$columna_hora_in2)
            hora_out = sheet.cell(12,$columna_hora_out2)
            nuevo = Schedule.new :fecha => fecha, :hora_entrada => hora_in, :hora_salida => hora_out, :employees_id => idEmp2
            nuevo.save!
            #id = sheet.cell(4,40)
            #id = '21'
            #puts sheet
            $i += 1
          end

          $columna_hora_in3 = 2
          $columna_hora_out3 = 7
          $i = 12
          while $i < 18 do
            hora_in = sheet.cell($i,$columna_hora_in3)
            hora_out = sheet.cell(12,$columna_hora_out3)
            nuevo = Schedule.new :fecha => fecha, :hora_entrada => hora_in, :hora_salida => hora_out, :employees_id => idEmp3
            nuevo.save!
            #id = sheet.cell(4,40)
            #id = '21'
            #puts sheet
            $i += 1
          end
         
          #puts Employee.select(:name).where("employee_id_number = ?",id)
        when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
        
      end
end
