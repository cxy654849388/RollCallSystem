import request from '@/utils/request'
import store from "../store";
import user from "../store/modules/user";
import {getToken} from "../utils/auth";

export function login(username, password) {
  return request({
    url: '/user/login',
    method: 'post',
    data: {
      'userId':username,
      'password':password
    },
  })
}

export function logout() {
  return request({
    url: '/user/logout',
    method: 'post',
  })
}
