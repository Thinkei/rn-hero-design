import React, { useState } from 'react';
import { ScrollView, Switch } from 'react-native';
import { ReSwitch, ReListItem } from 'rn-hero-design';

const SwitchScreen = () => {
  let [switch1, setSwitch1] = useState(false);
  let [switch2, setSwitch2] = useState(true);

  return (
    <ScrollView>
      <ReListItem
        title="Default off"
        rightElement={<ReSwitch value={switch1} onValueChange={setSwitch1} />}
        wrapperStyle={{ minHeight: 0 }}
      />
      <ReListItem
        title="Default on"
        rightElement={<ReSwitch value={switch2} onValueChange={setSwitch2} />}
        wrapperStyle={{ minHeight: 0 }}
      />
      <ReListItem
        title="Native switch"
        rightElement={<Switch value={true} />}
        wrapperStyle={{ minHeight: 0 }}
      />
    </ScrollView>
  );
};

export default SwitchScreen;
