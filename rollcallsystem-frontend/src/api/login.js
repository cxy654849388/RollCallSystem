import request from '@/utils/request'
import store from "../store";
import user from "../store/modules/user";
import {getToken} from "../utils/auth";

export function login(username, password) {
  let data = [
    ["userId", username],
    ["password", password],
  ];
  let url_params = new URLSearchParams(data);
  return request({
    url: '/user/login',
    method: 'post',
    data: url_params,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
    }
  })
}

export function logout() {
  let data = {'token': store.getters.token};
  let url_params = new URLSearchParams(data);
  return request({
    url: '/user/logout',
    method: 'post',
    params: url_params,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
    }
  })
}
