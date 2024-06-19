class InventoryController < ApplicationController
  def index
    #Login Form
  end

  def login
    
    @admin = Admin.find_by(username: params[:uname], password: params[:pass])

    if @admin
      
      redirect_to "/inventory/home"
    
    else
      redirect_to "/inventory"
    end
  end

  def home
    @data = Import.all
    @emp = Employee.all
    @storage = Storage.all
    @med = Medicine.all
    @sup = Supplier.all
    area1 = Storage.find(1)
    area2 = Storage.find(2)
    area3 = Storage.find(3)

    @area1 = area1
    @area2 = area2
    @area3 = area3



    @date = Date.today
    @time = 30.days
    #homapage
  end
  def import
    
    @import = Import.new(medicine_name: params[:medname],
                        company_name: params[:comp],
                        delivery_truck_platenumber: params[:plate],
                        storage_area: params[:area],
                        employee_name: params[:emp],
                        import_date: params[:imprtdate],
                        expiration_date: params[:exprdate],
                        total_products: params[:tproducts])
    @import.save

    @history = History.new(medicine_name: params[:medname],
                            company_name: params[:comp],
                            delivery_truck_platenumber: params[:plate],
                            import_date: params[:imprtdate],
                            expiration_date: params[:exprdate])
    @history.save

    @status = Storage.find_by(storage_area: params[:area])

    total = @status.status
    totalImp = params[:tproducts]
    stat = total.to_i + totalImp.to_i
    @status.update(status: stat)

    redirect_to "/inventory/home"
  end

  def editImp
    @edit = Import.find_by(id:params[:id])
    @emp = Employee.all
    @storage = Storage.all
    @med = Medicine.all
    @sup = Supplier.all
  end

  def updateImp
    @edit = Import.find_by(id:params[:id])
    @edit.update(medicine_name: params[:medname],
                        company_name: params[:comp],
                        delivery_truck_platenumber: params[:plate],
                        storage_area: params[:area],
                        employee_name: params[:emp],
                        expiration_date: params[:exprdate],
                        total_products: params[:tproducts])
    redirect_to "/inventory/home"
  end

  def register
    #register form
  end
  def registered
   
    @department = Admin.new(username: params[:uname],
                                password: params[:pass],
                                fullname: params[:name])
    @department.save
    redirect_to "/inventory/home"
  end 

  def deleteImp
    @delete_import = Import.delete(params[:id])
    redirect_to "/inventory/home"
  end
  def editEmp
    @emp = Employee.find_by(id: params[:id])

  end
  def updateEmp
    @emp = Employee.find_by(id:params[:id])
    @emp.update(employee_name: params[:empname],
                contact_number: params[:num])
    redirect_to "/inventory/home"
  end
  def deleteEmp
    @emp = Employee.delete(params[:id])
    redirect_to "/inventory/home"

  end
  def addEmp
    #add employee form
  end
  def addEmpCommit
    @emp = Employee.new(employee_name: params[:empname],
                        contact_number: params[:num])
    @emp.save
    redirect_to "/inventory/home"
  end

  def editSup
    @sup = Supplier.find_by(id: params[:id])

  end
  def updateSup
    @sup = Supplier.find_by(id:params[:id])
    @sup.update(company_name: params[:compname],
                company_ceo: params[:ceo],
                contact: params[:contact])
    redirect_to "/inventory/home"
  end
  def deleteSup
    @sup = Supplier.delete(params[:id])
    redirect_to "/inventory/home"
  end
  def addSup
    
  end
  def addSupCommit
    @sup = Supplier.new(company_name: params[:compname],
                        company_ceo: params[:ceo],
                        contact: params[:contact])
    @sup.save
    redirect_to "/inventory/home"

  end

  def editMed
    @med = Medicine.find_by(id: params[:id])
  end
  def updateMed
    @med = Medicine.find_by(id:params[:id])
    @med.update(medicine_name: params[:medname],
                medicine_type: params[:medtype],
                description: params[:des])
    redirect_to "/inventory/home"
  end
  def deleteMed
    @med = Medicine.delete(params[:id])
    redirect_to "/inventory/home"
  end
  def addMed
    #add medicine form
  end
  def addMedCommit
    @med = Medicine.new(medicine_name: params[:medname],
                        medicine_type: params[:medtype],
                        description: params[:des])
    @med.save
    redirect_to "/inventory/home"
  end
  def searchMed

    @@type = params[:type]
    puts @@type
    redirect_to "/inventory/showSearchMed"
  end
  def showSearchMed
    medtype = @@type
    @type = Medicine.where(medicine_type: medtype)

  end
  def history
    @history = History.all
  end

  def takeMed
    @take = Import.find(params[:id])
    @@storage = @take.storage_area
    @@tprod = @take.total_products

  end
 

  def takeMedCommit
    id = params[:id]
    amount = params[:amount]
    area = params[:area]
    storage_area = Storage.find_by(storage_area: area)

    stprod = storage_area.status
    secTotal = stprod.to_i - amount.to_i
    storage_area.update(status:secTotal)

    imptotal = @@tprod.to_i - amount.to_i
    imp = Import.find(id)
    imp.update(total_products:imptotal)

    redirect_to '/inventory/home'
  end
end
