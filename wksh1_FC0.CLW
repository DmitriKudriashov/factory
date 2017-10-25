   MEMBER


   INCLUDE('WKSH1GLF.CLW'),ONCE


Supplier             FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Supplier),PRE(SUP),BINDABLE,CREATE,THREAD !                    
ById                     KEY(SUP:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(SUP:SupplierName),NOCASE,OPT  !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
SupplierName                CSTRING(256)                   !                    
                         END
                     END                       

Category             FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Category),PRE(CAT),BINDABLE,CREATE,THREAD !                    
ById                     KEY(CAT:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(CAT:CategoryName),NOCASE,OPT  !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
CategoryName                CSTRING(256)                   !                    
                         END
                     END                       

Brand                FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Brand),PRE(BRA),BINDABLE,CREATE,THREAD !                    
ById                     KEY(BRA:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(BRA:BrandName),NOCASE,OPT     !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
BrandName                   CSTRING(256)                   !                    
                         END
                     END                       

Unit                 FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Unit),PRE(UNI),BINDABLE,CREATE,THREAD !                    
ById                     KEY(UNI:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(UNI:UnitName),NOCASE,OPT      !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
UnitName                    CSTRING(256)                   !                    
                         END
                     END                       

Product              FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Product),PRE(PRO),BINDABLE,CREATE,THREAD !                    
ById                     KEY(PRO:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(PRO:ProductName),NOCASE,OPT   !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
ProductName                 CSTRING(256)                   !                    
                         END
                     END                       

BudgetItem           FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_BudgetItem),PRE(BIT),BINDABLE,CREATE,THREAD !                    
ById                     KEY(BIT:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(BIT:BudgetItem),DUP,NOCASE,OPT !                    
ByCode                   KEY(BIT:CodeItem),NOCASE,OPT      !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
BudgetItem                  CSTRING(256)                   !                    
CodeItem                    CSTRING(25)                    !                    
                         END
                     END                       

Description          FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Description),PRE(DES),BINDABLE,CREATE,THREAD !                    
ById                     KEY(DES:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(DES:DescriptionName),NOCASE,OPT !                    
ByCategory               KEY(DES:Categories_id),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
DescriptionName             CSTRING(256)                   !                    
Categories_id               LONG                           !                    
                         END
                     END                       

ModelSet             FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_ModelSet),PRE(MOD),BINDABLE,CREATE,THREAD !                    
ById                     KEY(MOD:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByProduct_id             KEY(MOD:Product_id),DUP,NOCASE,OPT !                    
ByDate                   KEY(MOD:Dt),DUP,NOCASE,OPT        !                    
ByDateProduct_Id         KEY(-MOD:Dt,MOD:Product_id),DUP,NOCASE,OPT !by date (desc), Product Id
Record                   RECORD,PRE()
id                          LONG                           !                    
ModelNumber                 CSTRING(256)                   !                    
Dt                          LONG                           !Date created Model  
Product_id                  LONG                           !                    
                         END
                     END                       

ModelPrice           FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_ModelPrice),PRE(MDPRC),BINDABLE,CREATE,THREAD !                    
ById                     KEY(MDPRC:id),NOCASE,OPT,PRIMARY  !primary by Id       
ByModelNumbers_id        KEY(MDPRC:ModelNumbers_id),DUP,NOCASE,OPT !                    
ByDate                   KEY(MDPRC:dt),DUP,NOCASE,OPT      !                    
ByCategories_id          KEY(MDPRC:Categories_id),DUP,NOCASE !                    
ByDescriptions_id        KEY(MDPRC:Descriptions_id),DUP,NOCASE,OPT !                    
ByUnits_id               KEY(MDPRC:Units_id),DUP,NOCASE,OPT !                    
ByCurrencies_id          KEY(MDPRC:Currencies_id),DUP,NOCASE,OPT !                    
ByRateCurries_id         KEY(MDPRC:RateCurries_id),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
ModelNumbers_id             LONG                           !                    
dt                          LONG                           !date create model   
Categories_id               LONG                           !                    
Descriptions_id             LONG                           !                    
Quantty                     DECIMAL(15,5)                  !                    
Units_id                    LONG                           !                    
UnitPrice                   DECIMAL(15,2)                  !                    
Currencies_id               LONG                           !                    
RateCurries_id              LONG                           !                    
SumCurry                    DECIMAL(15,2)                  !                    
SumUSD                      DECIMAL(15,2)                  !                    
                         END
                     END                       

Currency             FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Currency),PRE(CUR),BINDABLE,CREATE,THREAD !                    
ById                     KEY(CUR:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByName                   KEY(CUR:CurrencyName),NOCASE,OPT  !                    
ByCode                   KEY(CUR:Code),NOCASE,OPT          !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
CurrencyName                CSTRING(256)                   !                    
Code                        STRING(3)                      !Short Code Currency 
                         END
                     END                       

RateCurry            FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_RateCurry),PRE(RAT),BINDABLE,CREATE,THREAD !                    
ById                     KEY(RAT:id),NOCASE,OPT,PRIMARY    !primary by Id       
ByCurrencies_id          KEY(RAT:Currencies_id),DUP,NOCASE,OPT !                    
ByCurrencies_id_Date     KEY(RAT:Currencies_id,-RAT:Dt),DUP,NOCASE,OPT !By Currencies , Date (desc)
Record                   RECORD,PRE()
id                          LONG                           !                    
Currencies_id               LONG                           !                    
Dt                          LONG                           !Date rate           
Rate                        DECIMAL(15,4)                  !                    
                         END
                     END                       

Inventory            FILE,DRIVER('MSSQL'),OEM,OWNER(glo:connectstring),NAME(F_Inventory),PRE(IVT),BINDABLE,CREATE,THREAD !                    
ById                     KEY(IVT:id),NOCASE,OPT,PRIMARY    !primary by Id       
BySupplier_id            KEY(IVT:Suppliers_id),DUP,NOCASE,OPT !                    
ByBudgetItem_id          KEY(IVT:BudgetItems_id),DUP,NOCASE,OPT !                    
ByBrandModel_id          KEY(IVT:BrandModels_id),DUP,NOCASE,OPT !                    
BySerialNumber           KEY(IVT:SerialNumber),DUP,NOCASE,OPT !                    
ByDescriptions_id        KEY(IVT:Descriptions_id),DUP,NOCASE,OPT !                    
ByCurries_id             KEY(IVT:Curries_id),DUP,NOCASE,OPT !                    
ByRates_id               KEY(IVT:Rates_id),DUP,NOCASE,OPT  !                    
ByUnits_id               KEY(IVT:Units_id),DUP,NOCASE      !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
Quantity                    DECIMAL(10,2)                  !                    
BudgetItems_id              LONG                           !                    
Descriptions_id             LONG                           !                    
BrandModels_id              LONG                           !                    
SerialNumber                CSTRING(256)                   !                    
Suppliers_id                CSTRING(256)                   !                    
Price                       DECIMAL(15,2)                  !                    
Sum                         DECIMAL(15,2)                  !                    
PriceUSD                    DECIMAL(15,2)                  !                    
SumUSD                      DECIMAL(15,2)                  !                    
Rates_id                    LONG                           !                    
Curries_id                  LONG                           !                    
Units_id                    LONG                           !                    
                         END
                     END                       

