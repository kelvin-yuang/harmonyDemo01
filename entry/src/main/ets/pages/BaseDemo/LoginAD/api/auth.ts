import {baseURL,userService} from '../../../Utils/constant'
import { service as http } from '../../../Utils/httpUtils';

const path = baseURL + userService;

class Auth {
  login(data){
    return http(
      `${path}/userinfo/api/ldapSinIn`,
      {
        method:"POST",
        data
      }
    );
  }
}
const authAPI = new Auth()
export { authAPI } ;
