import { Header } from '../../Components/Header'

import { TaskStatistics } from './components/TaskStatistics'
import { TaskList } from './components/TaskList'

@Entry
@Component
struct TaskManager {
  @State
  taskDone: number = 0
  @State
  taskTotal: number = 0

  build() {
    Column({ space: 10 }) {
      Row() {
        Header({ title: "TaskProgress" })
      }

      // 进度卡
      TaskStatistics({ taskDone: this.taskDone, taskTotal: this.taskTotal })

      // 任务卡
      TaskList({ taskDone: $taskDone, taskTotal: $taskTotal })

    }.backgroundColor("#F1F2F3").width("100%").height("100%").padding({ left: 10, right: 10, top: 10, bottom: 10 })

  }
}


