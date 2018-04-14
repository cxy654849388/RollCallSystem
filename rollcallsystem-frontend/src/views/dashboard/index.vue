<template>
  <div class="dashboard-container">
    <div class="dashboard-text">姓名:{{name}}</div>
    <div class="dashboard-text" v-if="role==='student'">角色:学生</div>
    <div class="dashboard-text" v-else-if="role==='teacher'">角色:教师</div>
    <div class="dashboard-text" v-else-if="role==='manager'">角色:管理员</div>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'

  export default {
    name: 'dashboard',
    computed: {
      ...mapGetters([
        'name',
        'role'
      ])
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .dashboard {
    &-container {
      margin: 30px;
    }
    &-text {
      font-size: 30px;
      line-height: 46px;
    }
  }
</style>
