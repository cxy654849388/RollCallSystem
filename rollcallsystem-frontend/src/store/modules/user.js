import {login, logout, getInfo} from '@/api/login'
import {
  getToken, setToken, removeToken, getName, setName,
  removeName, getRole, setRole, removeRole
} from '@/utils/auth'
import {Message, MessageBox} from 'element-ui'

const user = {
  state: {
    token: getToken(),
    name: getName(),
    role: getRole()
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_ROLE: (state, role) => {
      state.role = role
    }
  },

  actions: {
    // 登录
    Login({commit}, userInfo) {
      const username = userInfo.username.trim()
      return new Promise((resolve, reject) => {
        login(username, userInfo.password).then(response => {
          if(response.data.resultCode === 0){
            const data = response.data.result
            setToken(data.token)
            setName(data.name)
            setRole(data.userType)
            commit('SET_TOKEN', data.token)
            commit('SET_NAME', data.name)
            commit('SET_ROLE', data.userType)
            resolve()
          }
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 退出登录
    LogOut({commit, state}) {
      return new Promise((resolve, reject) => {
        logout(state.token).then(() => {
          commit('SET_TOKEN', '')
          commit('SET_NAME', '')
          commit('SET_ROLE', '')
          removeToken()
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 前端 登出
    FedLogOut({commit}) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        removeName()
        removeRole()
        resolve()
      })
    }
  }
}

export default user
