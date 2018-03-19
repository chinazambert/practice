struct empModel {

    1:required string name

    2:required i16 mis

}

service empService {


    empModel getEmpByName(1:string name)

    empModel getEmpByeMisNo(1:i16 mis)

    void  setEmp(1:empModel emp)

}