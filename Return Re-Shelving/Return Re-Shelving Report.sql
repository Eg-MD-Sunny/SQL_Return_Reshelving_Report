--Return Re-Shelving Report

select  t.LastActionOn,
        w.ID WarehouseID,
        w.Name WarehouseName,
        e.badgeid badgeid,
        e.FullName EmployeeName, 
        de.designationname,
        pv.id,
        pv.name,
        count(*) Quantity,
        dbo.tsn(FromState) FromState,
        dbo.tsn(ToState) ToState
        
from thingevent te
join thing t on t.id = te.thingid
join thingtransaction tt on tt.id = te.thingtransactionid
join productvariant pv on pv.id = t.productvariantid
join employee e on e.id = tt.CreatedByCustomerId
join designation de on de.id = e.designationid
join warehouse w on w.id=e.WarehouseId

where tt.fromstate in (2199023255552,274877906944,8796093022208,70368744177664,140737488355328)
and tt.tostate in (256)
and tt.CreatedOn>= '2022-08-06 00:00 +06:00'
and tt.CreatedOn < '2022-08-08 00:00 +06:00'
and pv.Id in (2443)
and w.Id in (27)

group by
t.LastActionOn,w.ID, w.Name,e.badgeid,e.FullName,de.designationname,pv.id,pv.name,dbo.tsn(FromState), dbo.tsn(ToState)
order by 3 desc

