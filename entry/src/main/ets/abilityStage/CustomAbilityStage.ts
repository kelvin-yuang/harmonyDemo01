import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

export default class CustomAbilityStage extends AbilityStage {
  onAcceptWant(want: Want): string {
    hilog.info(0x0000, 'testTag', '%{public}s', '-------- Ability onAcceptWant');
    if (want.abilityName === "AbilityDocument") {
      return `AbilityInstance_${want.parameters.instanceKey}`
    }
    return ""
  }
}