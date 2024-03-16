import { service as http } from '../../../Utils/httpUtils';

const baseURL = "http://192.168.149.1:9030";
const path = baseURL;

interface RPCData{
  method:string;
  params?:any;
}

class MoveDriver {
  movement(data:RPCData){
    const dataFormat = {...data,jsonrpc:"2.0",id:1}
    return http(
      `${path}`,
      {
        method:"POST",
        data:dataFormat
      }
    );
  }
  setLightColor(data:RPCData){
    const dataFormat = {...data,jsonrpc:"2.0",id:1}
    return http(
      `${path}`,
      {
        method:"POST",
        data:dataFormat
      }
    );
  }
}
const moveAPI = new MoveDriver()
export { moveAPI } ;